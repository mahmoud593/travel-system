import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/auth/data/model/user_model.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_cubit/posts_cubit.dart';
import 'package:travel_system/features/settings/data/edit_profile_repo_implement/edit_profile_repo_implement.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  static SettingsCubit get(context) => BlocProvider.of(context);

  TextEditingController editProfileNameController = TextEditingController();
  TextEditingController editProfileEmailController = TextEditingController();
  TextEditingController editProfilePayrollNumberController = TextEditingController();
  TextEditingController editProfilePhoneNumberController = TextEditingController();




  File? uploadedProfileImage;
  var imagePicker = ImagePicker();

  Future <void> getProfileImage() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      uploadedProfileImage = File(pickedFile.path);
      emit(UploadImageSuccessState());
    } else {
      debugPrint('No Image selected.');
      emit(UploadImageErrorState());
    }
  }

  UserModel? userModel;

  Future <void> getUserData() async {
    try{
      emit(GetUserDataLoadingState());
      Map<String , dynamic> userData = await EditProfileRepoImplement().getUserDataFromFireBase();

      userModel = UserModel.fromJson(userData);
      debugPrint("User data ==========> ${userModel?.toJson().toString()}");

      editProfileNameController.text = userModel!.userName;
      editProfileEmailController.text = userModel!.email;
      base = userModel!.beasNumber;
      rank = userModel!.rank;
      UserDataFromStorage.setuserPersonalImage(userModel!.userImage);
      UserDataFromStorage.setUserEmail(userModel!.email);
      UserDataFromStorage.setUserName(userModel!.userName);
      editProfilePayrollNumberController.text = userModel!.payRollNumber;
      editProfilePhoneNumberController.text = userModel!.phoneNumber;
      emit(GetUserDataSuccessState());

    }catch(e){
      debugPrint("Error when getting user data ==========> ${e.toString()}");
      emit(GetUserDataErrorState());
    }

  }



  updateUserData() async {

    String imageUrl = '';
    try{

      emit(UpdateUserProfileLoadingState());

      if(uploadedProfileImage != null){
        emit(UpdateUserProfileLoadingState());
        try{
          imageUrl = await EditProfileRepoImplement().uploadUserProfileImage(imageFile: uploadedProfileImage!);
          emit(UpdateUserProfileLoadingState());
        }catch(e){
          debugPrint("Error when uploading image ==========> ${e.toString()}");
          emit(UpdateUserProfileLoadingState());
        }
        await EditProfileRepoImplement().updateUserProfileData(
          email: editProfileEmailController.text,
          userName: editProfileNameController.text,
          phoneNumber: editProfilePhoneNumberController.text,
          payRollNumber: editProfilePayrollNumberController.text,
          airCrafts: userModel!.airCrafts,
          imageUrl: imageUrl
        ).then((value) async{
          debugPrint("User data updated =====> ${value.toString()}");
          await getUserData();
          emit(UpdateUserProfileSuccessState());
        });

      }
      else{
        await EditProfileRepoImplement().updateUserProfileData(
            email: editProfileEmailController.text,
            userName: editProfileNameController.text,
            phoneNumber: editProfilePhoneNumberController.text,
            payRollNumber: editProfilePayrollNumberController.text,
            airCrafts: userModel!.airCrafts,
            imageUrl: userModel!.userImage
        ).then((value) async{
          debugPrint("User data updated successfully =====> ${value.toString()}");
          await getUserData();
          emit(UpdateUserProfileSuccessState());
        });
      }

    }catch(e){
      debugPrint("Error when updating user data ==========> ${e.toString()}");
      emit(UpdateUserProfileErrorState());
    }
  }



  userSignOut({required BuildContext context}) async {
    await EditProfileRepoImplement().logout(context: context).then((value){
      UserDataFromStorage.setUserIsLogin(false);
      debugPrint("User logout successfully");
      emit(UserSignOutSuccessState());
    }).catchError((error){
      debugPrint("Error when user logout ==========> ${error.toString()}");
      emit(UserSignOutErrorState());
    });
  }



  deleteUser({required BuildContext context}) async {
    emit(DeleteUserLoadingState());
    await EditProfileRepoImplement().deleteAccount(context: context).then((value){
      UserDataFromStorage.removeAllDataFromStorage();
      debugPrint("User deleted successfully");
      emit(DeleteUserSuccessState());
    }).catchError((error){
      debugPrint("Error when deleting user ==========> ${error.toString()}");
      emit(DeleteUserErrorState());
    });
  }


  List<PostModel> favoritePosts = [];


  getFavoritePosts() async {
    favoritePosts = [];
    emit(GetFavoritePostsLoadingState());
    try{
      Constants.database.child("Users/${UserDataFromStorage.userId}/favorites").onValue.listen((event) {
        favoritePosts=[];
        event.snapshot.children.forEach((element) {
          favoritePosts.add(PostModel.fromJson(element.value as Map));
        });
        debugPrint("Favorite posts ==========> ${favoritePosts.toString()}");
        emit(GetFavoritePostsSuccessState());
      });
    }catch(e){
      debugPrint("Error when getting favorite posts ==========> ${e.toString()}");
      emit(GetFavoritePostsErrorState());
    }
  }


  bool checkIfPostIsFavorite({required String postId}) {
    bool isFavorite = false;
    for (var element in favoritePosts) {
      if(element.postId == postId){
        isFavorite = true;
      }
    }
    debugPrint("post (${postId}) isFavorite ==========> ${isFavorite.toString()}");
    emit(CheckIfIsFavorite());
    return isFavorite;
  }


  List<PostModel> historyPosts = [];

  List<PostModel> notifications = [];
  Map<String, int> notificationPercent = {};
  int percent = 0;

  getHistoryPosts() async {
    historyPosts = [];
    emit(GetHistoryPostsLoadingState());
    try{
      EditProfileRepoImplement().getUserHistory().then((value){
        historyPosts = value;
        debugPrint("History posts ==========> ${value.toString()}");
        emit(GetHistoryPostsSuccessState());
      }).catchError((error){
        debugPrint("Error when getting History posts ==========> ${error.toString()}");
        emit(GetHistoryPostsErrorState());
      });
    }catch(e){
      debugPrint("Error when getting History posts ==========> ${e.toString()}");
      emit(GetHistoryPostsErrorState());
    }
  }

  Future<void> getNotifications({required BuildContext context}) async {
    notifications = [];
    emit(GetNotificationsLoadingState());

    try{
      for(var historyElement in historyPosts){

        for(var postElement in PostsCubit.get(context).flights){
          int percent = 0;

          if(UserDataFromStorage.userId != postElement.uid){
            if(historyElement.postId != postElement.postId){
              print('Not this user');
              if(
              historyElement.iWantFlight.any((element) => postElement.iHaveFlight == element) ||
                  historyElement.visa.any((element) => postElement.visa.contains(element)) ||
                  historyElement.startTime == postElement.startTime ||
                  historyElement.willToFly.any((element) => postElement.willToFly.contains(element)))
              {

                if(!notifications.contains(postElement)){

                  notifications.add(postElement);


                  if(historyElement.iWantFlight.any((element) => postElement.iHaveFlight == element)){
                    print('1');
                    percent += 25;
                  }

                  if(historyElement.visa.any((element) => postElement.visa.contains(element))){
                    print('2');
                    percent += 25;
                  }

                  if(historyElement.startTime == postElement.startTime){
                    print('3');
                    percent += 25;
                  }

                  if(historyElement.willToFly.any((element) => postElement.willToFly.contains(element))){
                    print('4');
                    percent += 25;
                  }

                  notificationPercent[postElement.postId] = percent;

                  debugPrint("percent ==========> ${percent.toString()}");
                }

              }
            }
          }

        }
      }
      debugPrint("my notifications ==========> ${notifications.toString()}");
      emit(GetNotificationsSuccessState());

    }catch(e){
      debugPrint("Error when getting Notifications ==========> ${e.toString()}");
      emit(GetNotificationsErrorState());
    }
  }

  String ?rank ;
  String ?base ;
  TextEditingController contractType = TextEditingController();

  // void setRankDropDownValue({
  //   required value,
  // }){
  //   rank=value;
  //   emit(SetRankDropDownEditValueState());
  // }

  // void setBeasDropDownValue({
  //   required value,
  // }){
  //   base=value;
  //   emit(SetBaseDropDownEditValueState());
  // }

}
