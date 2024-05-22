abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoggedInState extends AuthState {
  final String uid;

  AuthLoggedInState({
    required this.uid,
  });
}

class AuthErrorState extends AuthState {
  final String errorMessage;

  AuthErrorState({
    required this.errorMessage,
  });
}

class AuthLoggedOutState extends AuthState {}
