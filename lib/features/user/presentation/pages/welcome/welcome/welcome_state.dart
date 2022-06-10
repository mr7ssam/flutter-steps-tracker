part of 'welcome_bloc.dart';

@immutable
abstract class WelcomeState {}

class WelcomeInitial extends WelcomeState {}

class WelcomeSuccess extends WelcomeState {}

class WelcomeLoading extends WelcomeState {
  WelcomeLoading();
}

class WelcomeFailure extends WelcomeState {
  final String message;

  WelcomeFailure(this.message);
}
