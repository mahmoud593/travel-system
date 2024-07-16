import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_system/features/auth/data/auth_repo_implement/register_repo_implement.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController peasController = TextEditingController();
  TextEditingController rankController = TextEditingController();
  TextEditingController payrollNumberController = TextEditingController();

  Future<void> register(
      {required String email,
      required String password,
      required String userName,
      required String phoneNumber,
      required String beasNumber,
      required String rank,
      required String payRollNumber,
      required List<int> airCrafts
      }) async {
    emit(RegisterLoading());
    try {
      RegisterRepoImplement().register(
        email: email,
        password: password,
        userName: userName,
        phoneNumber: phoneNumber,
        beasNumber: beasNumber,
        rank: rank,
        payRollNumber: payRollNumber,
        airCrafts: airCrafts
      )
          .then(
        (value) {
          uploadUserDataToFireBase(
              email: email,
              userName: userName,
              phoneNumber: phoneNumber,
              beasNumber: beasNumber,
              rank: rank,
              payRollNumber: payRollNumber,
              airCrafts: airCrafts
          );
        },
      );
      emit(RegisterSuccess());
    } on Exception catch (e) {
      debugPrint(e.toString());
      emit(RegisterFailure());
    }
  }

  List<int> selectedAirCrafts=[];

  Future<void> uploadUserDataToFireBase(
      {required String email,
      required String userName,
      required String phoneNumber,
      required String beasNumber,
      required String rank,
      required String payRollNumber,
      String? userImage,
      required List<int> airCrafts}) async {
    try {
      await RegisterRepoImplement().uploadUserDataToFireBase(
          email: email,
          userName: userName,
          phoneNumber: phoneNumber,
          beasNumber: beasNumber,
          rank: rank,
          payRollNumber: payRollNumber,
          userImage: userImage,
          airCrafts: airCrafts);
      // UserDataFromStorage.setUserId(uId);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }


}
