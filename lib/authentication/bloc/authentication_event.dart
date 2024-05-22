abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  final String errorMessage;

  LoginEvent(
      {required this.email, required this.password, this.errorMessage = ''});
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String errorMessage;

  RegisterEvent(
      {required this.email, required this.password, this.errorMessage = ''});
}

class LogoutEvent extends AuthEvent {}
