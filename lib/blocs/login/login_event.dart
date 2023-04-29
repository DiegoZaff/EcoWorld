part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class StartLogin extends LoginEvent {
  final String username;
  final String password;

  const StartLogin({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

class StartLogout extends LoginEvent {
  const StartLogout();
}

class RegisterUser extends LoginEvent {
  final String username;
  final String password;

  const RegisterUser({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}
