// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';

// part 'auth_event.dart';
// part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final AuthRepository authRepository;
//   AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
//     // When User Presses the SignIn Button, we will send the SignInRequested Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
//     on<SignInRequested>((event, emit) async {
//       emit(Loading());
//       try {
//         final response =
//             await authRepository.login(event.email, event.password);
//         if (!response.error) {
//           var token = StorageItem('token', response.data!.token!);
//           var details =
//               StorageItem('details', detailsToMap(response.data!.details!));
//           si.storageService.writeSecureData(token);
//           si.storageService.writeSecureData(details);
//           si.storageService.authWrite();
//           emit(Authenticated(response));
//         } else {
//           emit(AuthError(response.message));
//           emit(UnAuthenticated());
//         }
//       } catch (e) {
//         emit(AuthError(e.toString()));
//         emit(UnAuthenticated());
//       }
//     });

//     // When User Presses the SignUp Button, we will send the SignUpRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
//     on<SignUpRequested>((event, emit) async {
//       emit(Loading());
//       try {
//         final response = await authRepository.signUp(event.body);
//         emit(Authenticated(response));
//       } catch (e) {
//         emit(AuthError(e.toString()));
//         emit(UnAuthenticated());
//       }
//     });

//     // on<ResetPasswordRequested>((event, emit) async {
//     //   emit(Loading());
//     //   try {
//     //     await authRepository.resetPassword(
//     //         email: event.email, password: event.password);
//     //     emit(Authenticated());
//     //   } catch (e) {
//     //     emit(AuthError(e.toString()));
//     //     emit(UnAuthenticated());
//     //   }
//     // });

//     // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
//     on<SignOutRequested>((event, emit) async {
//       emit(Loading());
//       await authRepository.signOut();
//       emit(UnAuthenticated());
//     });
//   }
// }
