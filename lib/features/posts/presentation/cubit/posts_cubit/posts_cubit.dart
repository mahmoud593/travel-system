import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/auth/presentaion/cubit/auth_cubit/auth_cubit.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';
import 'package:travel_system/features/posts/data/posts_repo_implement/posts_repo_implement.dart';
import '../../../../new_posts/data/new_posts_repo_implement/new_posts_repo_implement.dart';
import '../posts_states/posts_states.dart';

class PostsCubit extends Cubit<PostsStates>{

  PostsCubit() : super(InitPostsState());

  static PostsCubit get(context) => BlocProvider.of(context);

  List<bool> locationFilterSelected=List.generate(100, (i) => false);

  var hoursFilterController=TextEditingController();
  var mintusFilterController=TextEditingController();

  int currentIndex=0;

  void switchBottomNav(int index){
    currentIndex=index;
    print(currentIndex);
    emit(HomeLayoutChangeBottomNavState());
  }


  List<PostModel> flights=[];

  Future<void> getPosts(context) async {
    flights=[];
    emit(GetPostsLoadingState());

    try{
      Constants.database.child('posts').onValue.listen((event) {
        flights=[];
        event.snapshot.children.forEach((element) {
          print('Length : ${event.snapshot.children.length}');
          var post=PostModel.fromJson(element.value as Map);
          if(post.rank == UserDataFromStorage.userRank){
            print('True');
            for(int i=0;i<UserDataFromStorage.userAirCrafts.length;i++){
              print('Post ${post.planeType} : ${UserDataFromStorage.userAirCrafts[i]}');
              if(post.planeType == UserDataFromStorage.userAirCrafts[i]){
                print('false');
                flights.add(PostModel.fromJson(element.value as Map));
              }
            }
          }
        });
        emit(GetPostsSuccessState());
      });
    } catch(error){
      print(error.toString());
      emit(GetPostsErrorState());
    }
  }



  String hoursFilterValue='';
  String dateTimeFilter='';
  String ?startDateFilter;
  String ?endDateFilter;


  void selectFilterDateTime({
    required value,
  }){
    hoursFilterValue='${value.hour}:${value.minute}';
    emit(SelectTimePickerValueState());
  }

  void selectFilterDateOfTravel({
    required value,
  }){
    dateTimeFilter=DateFormat.yMMMEd().format(value);
    emit(SelectTimePickerValueState());
  }

  void selectFilterStartDateTravel({
    required value,
  }){
    startDateFilter=DateFormat.yMMMEd().format(value);
    emit(SelectTimePickerValueState());
  }

  void selectFilterEndDateTravel({
    required value,
  }){
    endDateFilter=DateFormat.yMMMEd().format(value);
    emit(SelectTimePickerValueState());
  }

  String ?iHaveValue;
  String ?iWantValue;
  String hoursValue='';
  String ?dateTime;
  String ?startDate;
  String ?endDate;
  String ?willToFly;

  void setDropDownHaveValue({
    required value,
  }){
    iHaveValue=value;
    emit(SetDropDownValueState());
  }

  void setDropDownWantValue({
    required value,
  }){
    iWantValue=value;
    emit(SetDropDownValueState());
  }

  void selectDateTime({
    required value,
  }){
    hoursValue='${value.hour}:${value.minute}';
    emit(SelectTimePickerValueState());
  }

  void selectDateOfTravel({
    required value,
  }){
    dateTime=DateFormat.yMMMEd().format(value);
    emit(SelectTimePickerValueState());
  }

  void selectStartDateTravel({
    required value,
  }){
    startDate=DateFormat.yMMMEd().format(value);
    emit(SelectTimePickerValueState());
  }

  void selectEndDateTravel({
    required value,
  }){
    endDate=DateFormat.yMMMEd().format(value);
    emit(SelectTimePickerValueState());
  }

  void selectWillToFlyTravel({
    required value,
  }){
    willToFly=DateFormat.yMMMEd().format(value);
    emit(SelectTimePickerValueState());
  }

  String ?planeType;
  void setDropDownPlaneTypeValue({
    required value,
  }){
    planeType=value;
    emit(SetDropDownValueState());
  }

  String countryFilterSelected='';
  void changeCountryColor(int index,String country){

    locationFilterSelected=List.generate(100, (i) => false);
    locationFilterSelected[index]=true;
    countryFilterSelected=country;
    emit(ChangeCountryColorState());

  }

  Future<void> createPosts(
      {required String iHaveFlight,
        required String uid,
        required String dateTime,
        required String startTime,
        required String endTime,
        required String hours,
        required String willToFly,
        required String rank,
        required String planeType,
        required String iWantFlight,
        required String userName,
        context
      }
      )async{

    emit(CreateNewPostsLoadingState());

    PostsRepoImplement().uploadNewPosts(
        iHaveFlight: iHaveFlight,
        uid: uid,
        dateTime: dateTime,
        startTime: startTime,
        endTime: endTime,
        hours: hours,
        willToFly: willToFly,
        rank: rank,
        planeType: planeType,
        iWantFlight: iWantFlight,
        userName: userName
    ).then((value){
      print(state);
      print('Create New Post Successfully');
      emit(CreateNewPostsSuccessState());
    }).catchError((error){

      print('Error in Create New Posts is : ${error.toString()}');
      emit(CreateNewPostsErrorState());
    });

  }

  Future<void> filterPost({
     String ?city  ,
     String ?duration  ,
     String ?dateTime  ,
    context
  })async{

    emit(GetPostsLoadingState());
    try{
      Constants.database.child('posts').onValue.listen((event) {
        flights=[];
        event.snapshot.children.forEach((element) {
          var post=PostModel.fromJson(element.value as Map);
          if(post.rank == UserDataFromStorage.userRank){
            for(int i=0;i<UserDataFromStorage.userAirCrafts.length;i++){
              if(post.planeType == UserDataFromStorage.userAirCrafts[i]){
                print('city : ${city} , duration : ${duration} , dateTime : ${dateTime}');
                if(city !='' && duration !='' && dateTime !=''){
                  print('1');
                  if(city == post.iHaveFlight && duration == post.hours && dateTime == post.dateTime){
                    flights.add(PostModel.fromJson(element.value as Map));
                  }
                }
                else if(city !='' && duration !=''){
                  print('2');
                  if(city == post.iHaveFlight && duration == post.hours){
                    flights.add(PostModel.fromJson(element.value as Map));
                  }
                }
                else if(city !='' && dateTime !=''){
                  print('3');
                  if(city == post.iHaveFlight && dateTime == post.dateTime){
                    flights.add(PostModel.fromJson(element.value as Map));
                  }
                }
                else if(duration !='' && dateTime !=''){
                  print('4');
                  if(duration == post.hours && dateTime == post.dateTime){
                    flights.add(PostModel.fromJson(element.value as Map));
                  }
                }
                else if(city !=''){
                  print('5');
                  if(city == post.iHaveFlight){
                    flights.add(PostModel.fromJson(element.value as Map));
                  }
                }
                else if(duration !=''){
                  print('6');
                  if(duration == post.hours){
                    flights.add(PostModel.fromJson(element.value as Map));
                  }
                }
                else if(dateTime !=''){
                  print('6');
                  if(dateTime == post.dateTime){
                    flights.add(PostModel.fromJson(element.value as Map));
                  }
                }
              }
            }
          }
        });
        emit(GetPostsSuccessState());
      });
    } catch(error){
      print(error.toString());
      emit(GetPostsErrorState());
    }



  }

  List<PostModel> favoritePosts = [];

  getFavoritePosts() async {
    favoritePosts = [];
    emit(GetFavoriteLoadingState());
    try{
      FirebaseDatabase database = FirebaseDatabase.instance;
      database.ref('posts').onValue.listen((event) {
        favoritePosts=[];
        for (var element in event.snapshot.children) {
          favoritePosts.add(PostModel.fromJson(element.value as Map));
        }
        emit(GetFavoriteSuccessState());
      });
    }catch(e){
      debugPrint("Error when getting favorite posts ==========> ${e.toString()}");
      emit(GetFavoriteErrorState());
    }
  }


  addPostToFavorites({required PostModel postModel}) async {
    try{
      PostsRepoImplement().addPostToFavorites(postModel: postModel);
      await getFavoritePosts();
      emit(AddPostToFavoriteSuccessState());
    }catch(error){
      debugPrint("Error in Add post to favorites ============> ${error.toString()}");
      emit(AddPostToFavoriteErrorState());
    }

  }

  deletePostFromFavorites({required PostModel postModel}) async {
    try{
      PostsRepoImplement().deletePostFromFavorites(postModel: postModel);
      await getFavoritePosts();
      emit(DeletePostFromFavoriteSuccessState());
    }catch(error){
      debugPrint("Error in Add post to favorites ============> ${error.toString()}");
      emit(DeletePostFromFavoriteErrorState());
    }

  }



  bool checkIfPostIsFavorite({required String postId}){
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


}