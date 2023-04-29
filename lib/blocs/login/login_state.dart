part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoggedIn extends LoginState {
  final User user;

  const LoggedIn({required this.user});

  @override
  List<Object> get props => [user];
}
