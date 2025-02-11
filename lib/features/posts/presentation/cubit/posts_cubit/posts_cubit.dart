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
  List<bool> locationIWantSelected=List.generate(100, (i) => false);

  var hoursFilterController=TextEditingController();
  var mintusFilterController=TextEditingController();

  int currentIndex=0;

  void switchBottomNav(int index){
    currentIndex=index;
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

          DateTime dateTimeToday = DateTime.now();
          String formattedDatetime = DateFormat("dd-MMM-yyyy - HH:00").format(dateTimeToday);
          print(formattedDatetime);
          DateTime todayDate = DateFormat("dd-MMM-yyyy - HH:mm").parse(formattedDatetime);
          print(todayDate);
          DateTime endDate = DateFormat("dd-MMM-yyyy - HH:mm").parse(post.startTime);
          print(endDate);

          if(endDate.isAfter(todayDate)){
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
    dateTimeFilter=DateFormat('dd-MMM-yyyy').format(value);
    print(dateTimeFilter);
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
    startDate=value;
    emit(SelectTimePickerValueState());
  }

  void selectEndDateTravel({
    required value,
  }){
    endDate=value;
    emit(SelectTimePickerValueState());
  }

  void selectWillToFlyTravel({
    required value,
  }){
    willToFly=DateFormat.yMMMEd().format(value);
    emit(SelectTimePickerValueState());
  }

  List<String> willToFlyDays=[];
  void setWillToFlyDaysTravel({
    required value,
  }){
    willToFlyDays=[];
    willToFlyDays.add(value);
    print(willToFlyDays);
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

  List<String> countryIWantSelected=[];
  void changeIWantSelectedColor(int index,String country){

    // locationIWantSelected=List.generate(100, (i) => false);
    if(countryIWantSelected.contains(country)){
      locationIWantSelected[index]=false;
      countryIWantSelected.remove(country);
      print(countryIWantSelected);

    }else{
      locationIWantSelected[index]=true;
      countryIWantSelected.add(country);
      print(countryIWantSelected);
    }

    emit(ChangeCountryColorState());

  }

  Future<void> createPosts(
      {
        required String iHaveFlight,
        required String uid,
        required String startTime,
        required String endTime,
        required List<String> willToFly,
        required String rank,
        required String planeType,
        required String PRN,
        required List<String> iWantFlight,
        required String userName,
        required String phoneNumber,
        required String iHaveLav,
        required List<String> iWantLav,
        required List<String> visa,
        required String iWantHours,
        required String iHaveHours,
        context
      }
      )async{

    emit(CreateNewPostsLoadingState());

    PostsRepoImplement().uploadNewPosts(
        iHaveFlight: iHaveFlight,
        uid: uid,
        PRN: PRN,
        startTime: startTime,
        endTime: endTime,
        willToFly: willToFly,
        rank: rank,
        planeType: planeType,
        iWantFlight: iWantFlight,
        phoneNumber: phoneNumber,
        userName: userName,
        iWantHours: iWantHours,
        iHaveHours: iHaveHours,
        iHaveLav: iHaveLav,
        iWantLav: iWantLav,
        visa: visa,
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

                List<String> parts = post.startTime.split(' - ');

                String datePart = parts[0];
                print(datePart);

                if(city !='' && duration !='' && dateTime !=''){
                  if(city == post.iHaveFlight && duration == post.iHaveLav && dateTime == datePart){
                    flights.add(PostModel.fromJson(element.value as Map));
                  }
                }
                else if(city !='' && duration !=''){
                  print('2');
                  if(city == post.iHaveFlight && duration == post.iHaveLav){
                    flights.add(PostModel.fromJson(element.value as Map));
                  }
                }
                else if(city !='' && dateTime !=''){
                  print('3');
                  if(city == post.iHaveFlight && dateTime == datePart){
                    flights.add(PostModel.fromJson(element.value as Map));
                  }
                }
                else if(duration !='' && dateTime !=''){
                  print('4');
                  if(duration == post.iHaveLav && dateTime == datePart){
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
                  if(duration == post.iHaveLav){
                    flights.add(PostModel.fromJson(element.value as Map));
                  }
                }
                else if(dateTime !=''){
                  print('6');
                  if(dateTime == datePart){
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
      database.ref('Users').child('${UserDataFromStorage.userId}').child('favorites').onValue.listen((event) {
        favoritePosts=[];
        for (var element in event.snapshot.children) {
          favoritePosts.add(PostModel.fromJson(element.value as Map));
        }
        print('Get Favorite Posts Successfully');
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
      isFavorite = true;
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
      isFavorite = false;
      emit(DeletePostFromFavoriteSuccessState());
    }catch(error){
      debugPrint("Error in Add post to favorites ============> ${error.toString()}");
      emit(DeletePostFromFavoriteErrorState());
    }

  }


  bool isFavorite = false;

  bool checkIfPostIsFavorite({required String postId}){
    isFavorite=false;
    for (var element in favoritePosts) {
      if(element.postId == postId){
        isFavorite = true;
      }
    }
    debugPrint("post (${postId}) isFavorite ==========> ${isFavorite.toString()}");
    emit(CheckIfIsFavorite());
    return isFavorite;
  }


   var iWantDetailsController = TextEditingController();
   var iHaveDetailsController = TextEditingController();
   var prnDetailsController = TextEditingController();
   var iHaveLavHoursDetailsController = TextEditingController();
   var iWantLavHoursDetailsController = TextEditingController();
   var sDateDetailsController = TextEditingController();
   var eDateDetailsController = TextEditingController();
   var willToFlyDetailsController = TextEditingController();
   var planeTypeDetailsController = TextEditingController();
   var visaDetailsController = TextEditingController();
   var iHaveLavDetailsController = TextEditingController();

  void setPostDetails({required  PostModel postModel}){
    // iWantDetailsController.text = postModel.iWantFlight;
    iHaveDetailsController.text = postModel.iHaveFlight;
    prnDetailsController.text = postModel.PRN;
    iHaveLavDetailsController.text = postModel.iHaveLav;
    iHaveLavHoursDetailsController.text = postModel.iHaveHours;
    iWantLavHoursDetailsController.text = postModel.iWantHours;
    sDateDetailsController.text = postModel.startTime;
    eDateDetailsController.text = postModel.endTime;
    planeTypeDetailsController.text = postModel.planeType;
  }

  int iHaveLayover=0;
  int iHaveRoundTrip=0;
  bool iWantLayover=false;
  bool iWantRoundTrip=false;
  int filterLayover=3;
  bool setVisaChine=false;
  bool setVisaUsa=false;
  List<String> selectVisaList=[];

  void setIHaveLayover({required int value}){
    iHaveLayover=value;
    emit(ChangeIHaveLayoverState());
  }

  void setIHaveRoundTrip({required int value}){
    iHaveRoundTrip=value;
    emit(ChangeIHaveRoundTripState());
  }


  void setIWantLayover({required int value}){
    // iWantLayover=value;
    emit(ChangeIWantLayoverState());
  }

  void setFilterLayover({required int value}){
    filterLayover=value;
    emit(ChangeIWantLayoverState());
  }

  void setVisaChineTrip({required bool value}){
    if(value== true){
      setVisaChine=value;
      selectVisaList.add('CHINA');
    }else{
      setVisaChine=value;
      selectVisaList.remove('CHINA');
    }
    emit(ChangeIWantRoundTripState());
  }

  bool setIWantLav=false;
  bool setIWantRad=false;
  List<String> selectIWantLavList=[];
  void setIWantLavTrip({required bool value}){
    if(value== true){
      setIWantLav=value;
      selectIWantLavList.add('Layover');
    }else{
      setIWantLav=value;
      selectIWantLavList.remove('Layover');
    }
    emit(ChangeIWantRoundTripState());
  }

  void setIWantRodTrip({required bool value}){
    if(value== true){
      setIWantRad=value;
      selectIWantLavList.add('Round Trip');
    }else{
      setIWantRad=value;
      selectIWantLavList.remove('Round Trip');
    }
    emit(ChangeIWantRoundTripState());
  }

  void setVisaUsaTrip({required bool value}){
    if(value== true){
      setVisaUsa=value;
      selectVisaList.add('USA');
    }else{
      setVisaUsa=value;
      selectVisaList.remove('USA');
    }
    emit(ChangeIWantRoundTripState());
  }


  List<String> iHaveList=[];
  List<String> iWantList=[];

  Future<void> fetchIWantList() async{

    iWantList=[];
    emit(FetchIWantLoadingState());
    Constants.database.child('iWant').onValue.listen((event) {

      event.snapshot.children.forEach((element) {
        iWantList.add((element.value as Map)['name']);
      });

      print('IWantList ==========> ${iWantList.toString()}');

      emit(FetchIWantSuccessState());

    });

  }

  Future<void> fetchIHaveList() async{

    iHaveList=[];
    emit(FetchIHaveLoadingState());
    Constants.database.child('iHave').onValue.listen((event) {

      event.snapshot.children.forEach((element) {
        iHaveList.add((element.value as Map)['name']);
      });

      print('iHaveList  ==========> ${iHaveList.toString()}');

      emit(FetchIHaveSuccessState());

    });

  }

  bool isFilter=false;

  void setIsFilter({required bool value}){
    isFilter=value;
    emit(ChangeIsFilterState());
  }


}