import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_system/features/new_posts/data/new_posts_repo_implement/new_posts_repo_implement.dart';
import 'package:travel_system/features/new_posts/presentation/cubit/new_post_states.dart';

class NewPostCubit extends Cubit<NewPostStates>{

  NewPostCubit() : super(InitialState());

  static NewPostCubit get(context)=>BlocProvider.of(context);


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
    print(hoursValue);
    emit(SelectTimePickerValueState());
  }

  void selectDateOfTravel({
    required value,
  }){
    dateTime=DateFormat.yMd().format(value);
    print(dateTime);
    emit(SelectTimePickerValueState());
  }

  void selectStartDateTravel({
    required value,
  }){
    startDate=DateFormat.yMd().format(value);
    print(startDate);
    emit(SelectTimePickerValueState());
  }

  void selectEndDateTravel({
    required value,
  }){
    endDate=DateFormat.yMd().format(value);
    print(endDate);
    emit(SelectTimePickerValueState());
  }

  void selectWillToFlyTravel({
    required value,
  }){
    willToFly=DateFormat.yMd().format(value);
    print(willToFly);
    emit(SelectTimePickerValueState());
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
        required String userName}
      )async{

    emit(CreateNewPostsLoadingState());

    NewPostsRepoImplement().uploadNewPosts(
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

      print('Create New Post Successfully');
      emit(CreateNewPostsSuccessState());
    }).catchError((error){

      print('Error in Create New Posts is : ${error.toString()}');
      emit(CreateNewPostsErrorState());
    });

  }

}