import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../api/user.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<StartLogin>(_onStartLogin);
    on<RegisterUser>(_onRegisterUser);
    on<StartLogout>(_onStartLogout);
  }

  Future<FutureOr<void>> _onStartLogin(
      StartLogin event, Emitter<LoginState> emit) async {
    try {
      final user = await logInUser(event.username, event.password);
      emit(LoggedIn(user: user));
    } catch (e) {
      emit(LoginInitial());
    }
  }

  Future<FutureOr<void>> _onRegisterUser(
      RegisterUser event, Emitter<LoginState> emit) async {
    try {
      final user = await registerUser(event.username, event.password);
      emit(LoggedIn(user: user));
    } catch (e) {
      emit(LoginInitial());
    }
  }

  FutureOr<void> _onStartLogout(StartLogout event, Emitter<LoginState> emit) {}
}
