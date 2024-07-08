import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_system/features/auth/data/auth_repo_implement/register_repo_implement.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> register(
      {required String email,
      required String password,
      required String userName,
      required String phoneNumber,
      required String beasNumber,
      required String rank,
      required String payRollNumber}) async {
    emit(RegisterLoading());
    try {
      RegisterRepoImplement()
          .register(
        email: email,
        password: password,
        userName: userName,
        phoneNumber: phoneNumber,
        beasNumber: beasNumber,
        rank: rank,
        payRollNumber: payRollNumber,
      ).then((value) {
          uploadUserDataToFireBase(
              email: email,
              userName: userName,
              phoneNumber: phoneNumber,
              beasNumber: beasNumber,
              rank: rank,
              payRollNumber: payRollNumber);
        },
      );
      emit(RegisterSuccess());
    } on Exception catch (e) {
      debugPrint(e.toString());
      emit(RegisterFailure());
    }
  }

  Future<void> uploadUserDataToFireBase(
      {required String email,
      required String userName,
      required String phoneNumber,
      required String beasNumber,
      required String rank,
      required String payRollNumber}) async {
    emit(RegisterLoading());
    try {
      RegisterRepoImplement().uploadUserDataToFireBase(
          email: email,
          userName: userName,
          phoneNumber: phoneNumber,
          beasNumber: beasNumber,
          rank: rank,
          payRollNumber: payRollNumber);
      // UserDataFromStorage.setUserId(uId);
      emit(RegisterSuccess());
    } on Exception catch (e) {
      debugPrint(e.toString());
      emit(RegisterFailure());
    }
  }
}
