import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_system/features/auth/data/auth_repo_implement/login_repo_implement.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login({required String email, required String password}) async {
  emit(LoginLoading());
  try {
    LoginRepoImplement().login(email: email, password: password);
    emit(LoginSuccess());
  } on Exception catch (e) {
    debugPrint (e.toString());
    emit(LoginFailure());
  }
}

}

