part of 'welcome_bloc.dart';

@immutable
abstract class WelcomeEvent {}

class WelcomeSignInSkipped extends WelcomeEvent {
  final BuildContext context;

  WelcomeSignInSkipped(this.context);
}
