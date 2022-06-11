// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `The Duck Is Walking Now!`
  String get app_splash_title {
    return Intl.message(
      'The Duck Is Walking Now!',
      name: 'app_splash_title',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Steps Tracker`
  String get app_title {
    return Intl.message(
      'Flutter Steps Tracker',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Antonymous Login`
  String get antonymous_login {
    return Intl.message(
      'Antonymous Login',
      name: 'antonymous_login',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Enter a email`
  String get enter_email {
    return Intl.message(
      'Enter a email',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enter_name {
    return Intl.message(
      'Enter your name',
      name: 'enter_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get email_validation {
    return Intl.message(
      'Enter a valid email',
      name: 'email_validation',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `continue`
  String get continue_t {
    return Intl.message(
      'continue',
      name: 'continue_t',
      desc: '',
      args: [],
    );
  }

  /// `This filed is required`
  String get required_validation {
    return Intl.message(
      'This filed is required',
      name: 'required_validation',
      desc: '',
      args: [],
    );
  }

  /// `Enter a password`
  String get enter_password {
    return Intl.message(
      'Enter a password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Your steps today`
  String get steps_today {
    return Intl.message(
      'Your steps today',
      name: 'steps_today',
      desc: '',
      args: [],
    );
  }

  /// `Health Points`
  String get health_points {
    return Intl.message(
      'Health Points',
      name: 'health_points',
      desc: '',
      args: [],
    );
  }

  /// `Redeems`
  String get redeems {
    return Intl.message(
      'Redeems',
      name: 'redeems',
      desc: '',
      args: [],
    );
  }

  /// `Get {bigReward} HP for {big} steps, and {smallReward} HP for {small} steps`
  String health_points_clarify(
      int bigReward, int big, int smallReward, int small) {
    return Intl.message(
      'Get $bigReward HP for $big steps, and $smallReward HP for $small steps',
      name: 'health_points_clarify',
      desc: '',
      args: [bigReward, big, smallReward, small],
    );
  }

  /// `You awarded a {hp} HP`
  String award_title(int hp) {
    return Intl.message(
      'You awarded a $hp HP',
      name: 'award_title',
      desc: '',
      args: [hp],
    );
  }

  /// `You bought a {name} and spent {hp} HP`
  String redeems_title(int hp, String name) {
    return Intl.message(
      'You bought a $name and spent $hp HP',
      name: 'redeems_title',
      desc: '',
      args: [hp, name],
    );
  }

  /// `Big one`
  String get big_one {
    return Intl.message(
      'Big one',
      name: 'big_one',
      desc: '',
      args: [],
    );
  }

  /// `Keep moving, you got {hp} HP`
  String keep_moving(int hp) {
    return Intl.message(
      'Keep moving, you got $hp HP',
      name: 'keep_moving',
      desc: '',
      args: [hp],
    );
  }

  /// `There is no gifts yet! 😭`
  String get empty_gifts {
    return Intl.message(
      'There is no gifts yet! 😭',
      name: 'empty_gifts',
      desc: '',
      args: [],
    );
  }

  /// `No redeems 😢`
  String get empty_health_points_history {
    return Intl.message(
      'No redeems 😢',
      name: 'empty_health_points_history',
      desc: '',
      args: [],
    );
  }

  /// `There is no gifts yet! 😭`
  String get empty_redeems_history {
    return Intl.message(
      'There is no gifts yet! 😭',
      name: 'empty_redeems_history',
      desc: '',
      args: [],
    );
  }

  /// `Lazy Town!🌚`
  String get empty_rank {
    return Intl.message(
      'Lazy Town!🌚',
      name: 'empty_rank',
      desc: '',
      args: [],
    );
  }

  /// `No enough HP!`
  String get now_enough_hp {
    return Intl.message(
      'No enough HP!',
      name: 'now_enough_hp',
      desc: '',
      args: [],
    );
  }

  /// `Device is not supported!`
  String get not_supported_device {
    return Intl.message(
      'Device is not supported!',
      name: 'not_supported_device',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
