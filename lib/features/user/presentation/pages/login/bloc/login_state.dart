part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginLoading extends LoginState {
  LoginLoading();
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
}
