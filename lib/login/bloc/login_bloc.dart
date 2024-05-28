// import 'package:bloc/bloc.dart';
// import 'package:mushu_app/authentication/auth.dart';
// import 'package:mushu_app/login/bloc/login_event.dart';
// import 'package:mushu_app/login/bloc/login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final Auth _auth = Auth();

//   LoginBloc(super.initialState);

//   LoginState get initialState => LoginInitialState();

//   Stream<LoginState> mapEventToState(LoginEvent event) async* {
//     if (event is LoginSubmitEvent) {
//       yield* _mapLoginSubmitEventToState(event);
//     }
//   }

//   Stream<LoginState> _mapLoginSubmitEventToState(
//       LoginSubmitEvent event) async* {
//     try {
//       String? uid = await _auth.signInWithEmailAndPassword(
//         event.email,
//         event.password,
//       );
//       if (uid != null) {
//         yield LoginSuccessState(
//           uid: uid,
//         );
//       } else {
//         yield LoginErrorState(
//           errorMessage: 'User not found or password is incorrect',
//         );
//       }
//     } catch (e) {
//       yield LoginErrorState(
//         errorMessage: e.toString(),
//       );
//     }
//   }
// }
