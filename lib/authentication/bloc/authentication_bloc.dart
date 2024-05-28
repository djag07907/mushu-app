import 'package:bloc/bloc.dart';
import 'package:mushu_app/authentication/service/auth.dart';
import 'package:mushu_app/authentication/bloc/authentication_event.dart';
import 'package:mushu_app/authentication/bloc/authentication_state.dart';
import 'package:mushu_app/resources/constants.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Auth _auth = Auth();

  AuthBloc(super.initialState);

  AuthState get initialState => AuthInitialState();

  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield* _mapLoginEventToState(event);
    } else if (event is RegisterEvent) {
      yield* _mapRegisterEventToState(event);
    } else if (event is LogoutEvent) {
      yield* _mapLogoutEventToState();
    }
  }

  Stream<AuthState> _mapLoginEventToState(LoginEvent event) async* {
    try {
      String? uid = await _auth.signInWithEmailAndPassword(
        event.email,
        event.password,
      );
      if (uid != null) {
        yield AuthLoggedInState(
          uid: uid,
        );
      } else {
        yield AuthErrorState(
          errorMessage: userNotFound,
        );
      }
    } catch (e) {
      yield AuthErrorState(
        errorMessage: e.toString(),
      );
    }
  }

  Stream<AuthState> _mapRegisterEventToState(RegisterEvent event) async* {
    try {
      String? uid = await _auth.registerWithEmailAndPassword(
        event.email,
        event.password,
      );
      if (uid != null) {
        yield AuthLoggedInState(
          uid: uid,
        );
      } else {
        yield AuthErrorState(
          errorMessage: event.errorMessage,
        );
      }
    } catch (e) {
      yield AuthErrorState(
        errorMessage: e.toString(),
      );
    }
  }

  Stream<AuthState> _mapLogoutEventToState() async* {
    await _auth.signOut();
    yield AuthLoggedOutState();
  }
}
