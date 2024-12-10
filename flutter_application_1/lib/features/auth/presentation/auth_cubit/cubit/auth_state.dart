 class AuthState {}

final class AuthInitial extends AuthState {}
final class SignuoLoadingState extends AuthState {}
final class SignupSuccessState extends AuthState {}
final class SignupFailureState extends AuthState {
  final String errMessage;
  SignupFailureState({required this.errMessage});
}