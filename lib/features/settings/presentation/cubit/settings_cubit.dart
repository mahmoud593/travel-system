import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/auth/data/model/user_model.dart';
import 'package:travel_system/features/settings/data/edit_profile_repo_implement/edit_profile_repo_implement.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  static SettingsCubit get(context) => BlocProvider.of(context);

  TextEditingController editProfileNameController = TextEditingController();
  TextEditingController editProfileEmailController = TextEditingController();
  TextEditingController editProfileBaseController = TextEditingController();
  TextEditingController editProfileRankController = TextEditingController();
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
      editProfileBaseController.text = userModel!.beasNumber;
      editProfileRankController.text = userModel!.rank;
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
        emit(UploadImageSuccessState());
        try{
          imageUrl = await EditProfileRepoImplement().uploadUserProfileImage(imageFile: uploadedProfileImage!);
          emit(UploadImageSuccessState());
        }catch(e){
          debugPrint("Error when uploading image ==========> ${e.toString()}");
          emit(UploadImageErrorState());
        }
        await EditProfileRepoImplement().updateUserProfileData(
          email: editProfileEmailController.text,
          userName: editProfileNameController.text,
          phoneNumber: editProfilePhoneNumberController.text,
          beasNumber: editProfileBaseController.text,
          rank: editProfileRankController.text,
          payRollNumber: editProfilePayrollNumberController.text,
          airCrafts: userModel!.airCrafts,
          imageUrl: imageUrl
        ).then((value) async{
          debugPrint("User data updated successfully =====> ${value.toString()}");
          await getUserData();
          emit(UpdateUserProfileSuccessState());
        });

      }
      else{
        await EditProfileRepoImplement().updateUserProfileData(
            email: editProfileEmailController.text,
            userName: editProfileNameController.text,
            phoneNumber: editProfilePhoneNumberController.text,
            beasNumber: editProfileBaseController.text,
            rank: editProfileRankController.text,
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
      debugPrint("User logout successfully");
      emit(UserSignOutSuccessState());
    }).catchError((error){
      debugPrint("Error when user logout ==========> ${error.toString()}");
      emit(UserSignOutErrorState());
    });
  }



}
