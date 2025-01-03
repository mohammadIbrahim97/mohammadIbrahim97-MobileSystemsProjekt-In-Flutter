 class AuthState {}

final class AuthInitial extends AuthState {}
final class SignupLoadingState extends AuthState {}
final class SignupSuccessState extends AuthState {}
final class SignupFailureState extends AuthState {
  final String errMessage;
  SignupFailureState({required this.errMessage});
}
final class TermsAndConditionState extends AuthState {}


final class SigninLoadingState extends AuthState {}
final class SigninSuccessState extends AuthState {}
final class SigninFailureState extends AuthState {
  final String errMessage;
  SigninFailureState({required this.errMessage});
}