part of 'auth_cubit.dart';


@immutable
sealed class AuthState {}
final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}
final class LoginSuccess extends AuthState {}
final class LoginFailure extends AuthState {
  final String errorMessage;
  LoginFailure({required this.errorMessage});
}

final class RegisterLoading extends AuthState {}
final class RegisterSuccess extends AuthState {}
final class RegisterFailure extends AuthState {
  final String errorMessage;
  RegisterFailure({required this.errorMessage});
}

final class UploadUserDataLoading extends AuthState {}
final class UploadUserDataSuccess extends AuthState {}
final class UploadUserDataFailure extends AuthState {}

final class GetUserLoading extends AuthState {}
final class GetUserSuccess extends AuthState {}
final class GetUserFailure extends AuthState {}

final class SetRankDropDownValueState extends AuthState {}
final class SetBaseDropDownValueState extends AuthState {}

final class FetchRanksLoadingState extends AuthState {}
final class FetchRanksSuccessState extends AuthState {}

final class FetchBaseLoadingState extends AuthState {}
final class FetchBaseSuccessState extends AuthState {}

final class ForgetPasswordLoading extends AuthState {}
final class ForgetPasswordSuccess extends AuthState {}
final class ForgetPasswordFailure extends AuthState {}

