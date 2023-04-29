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

  FutureOr<void> _onStartLogin(StartLogin event, Emitter<LoginState> emit) {}

  Future<FutureOr<void>> _onRegisterUser(
      RegisterUser event, Emitter<LoginState> emit) async {
    final user = await registerUser(event.username, event.password);

    emit(LoggedIn(user: user));
  }

  FutureOr<void> _onStartLogout(StartLogout event, Emitter<LoginState> emit) {}
}
