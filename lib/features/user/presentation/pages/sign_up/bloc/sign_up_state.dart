part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpLoading extends SignUpState {

  SignUpLoading();
}

class SignUpFailure extends SignUpState {
  final String message;

  SignUpFailure(this.message);
}
