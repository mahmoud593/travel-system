import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';
import 'package:travel_system/features/posts/data/posts_repo_implement/posts_repo_implement.dart';
import '../../../../new_posts/data/new_posts_repo_implement/new_posts_repo_implement.dart';
import '../posts_states/posts_states.dart';

class PostsCubit extends Cubit<PostsStates>{

  PostsCubit() : super(InitPostsState());

  static PostsCubit get(context) => BlocProvider.of(context);


  int currentIndex=0;

  void switchBottomNav(int index){
    currentIndex=index;
    print(currentIndex);
    emit(HomeLayoutChangeBottomNavState());
  }


  List<PostModel> flights=[];

  Future<void> getPosts() async {
    flights=[];
    emit(GetPostsLoadingState());

    try{
      Constants.database.child('posts').onValue.listen((event) {
        flights=[];
        event.snapshot.children.forEach((element) {
          flights.add(PostModel.fromJson(element.value as Map));
        });
        emit(GetPostsSuccessState());
      });
    } catch(error){
      print(error.toString());
      emit(GetPostsErrorState());
    }
  }



  String hoursFilterValue='';
  String ?dateTimeFilter;
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


}