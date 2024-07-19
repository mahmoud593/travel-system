import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/auth/data/auth_repo_implement/auth_repo_implement.dart';
import 'package:travel_system/features/auth/data/model/user_model.dart';
import 'package:travel_system/features/settings/data/edit_profile_repo_implement/edit_profile_repo_implement.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/widets/toast.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController peasController = TextEditingController();
  TextEditingController rankController = TextEditingController();
  TextEditingController payrollNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();


  Future<void> login({required String email, required String password}) async {
    try {
      emit(LoginLoading());
       await AuthRepoImplement().login(email: email, password: password).then((value)  async{
      await  EditProfileRepoImplement().getUserDataFromFireBase().then((value){
          UserModel userModel = UserModel.fromJson(value);
          UserDataFromStorage.setUserId(userModel.uid);
          UserDataFromStorage.setUserEmail(userModel.email);
          UserDataFromStorage.setUserName(userModel.userName);
          UserDataFromStorage.setUserPhone(userModel.phoneNumber);
          UserDataFromStorage.setUserBaseNumber(userModel.beasNumber);
          UserDataFromStorage.setUserRank(userModel.rank);
          UserDataFromStorage.setUserPayrollNumber(userModel.payRollNumber);
          // UserDataFromStorage.setAirCrafts(userModel.airCrafts!);
          UserDataFromStorage.setuserPersonalImage(userModel.userImage);
          UserDataFromStorage.setUserIsLogin(true);
          emit(LoginSuccess());

      });
      },);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      debugPrint('Failed with error code: ${e.code}');
      debugPrint(e.message);
      String errorMessage;
      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'user-disabled':
          errorMessage = 'The user corresponding to the given email has been disabled.';
          break;
        case 'user-not-found':
          errorMessage = 'There is no user corresponding to the given email.';
          break;
        case 'wrong-password':
          errorMessage = 'The password is invalid or the user does not have a password.';
          break;
        case 'credential-already-in-use':
          errorMessage = 'This email address is already in use.';
          break;
        default:
          errorMessage = 'An unknown error occurred.';
          break;
      }
      emit(LoginFailure(errorMessage: errorMessage));
    } catch (e) {
      debugPrint('An error occurred: $e');
      emit(LoginFailure(errorMessage: 'An unknown error occurred.'));
    }
  }
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
      emit(RegisterLoading());
      AuthRepoImplement().register(
          email: email,
          password: password,
          userName: userName,
          phoneNumber: phoneNumber,
          beasNumber: beasNumber,
          rank: rank,
          payRollNumber: payRollNumber,
          airCrafts: airCrafts).then(
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
          getUserFromFireBase();
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
      await AuthRepoImplement().uploadUserDataToFireBase(
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

  Future<void> getUserFromFireBase() async {
    emit(GetUserLoading());
    try {
      await AuthRepoImplement().getUserFromFireBase();
      emit(GetUserSuccess());
    } on Exception catch (e) {
      debugPrint(e.toString());
      emit(GetUserFailure());
    }
  }


}

