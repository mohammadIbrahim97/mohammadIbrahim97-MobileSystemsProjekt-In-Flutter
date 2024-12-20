 class AuthState {}

final class AuthInitial extends AuthState {}
final class SignupLoadingState extends AuthState {}
final class SignupSuccessState extends AuthState {}
final class SignupFailureState extends AuthState {
  final String errMessage;
  SignupFailureState({required this.errMessage});
}
final class TermsAndConditionState extends AuthState {}
