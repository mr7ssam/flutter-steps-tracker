// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(hp) => "You awarded a ${hp} HP";

  static String m1(bigReward, big, smallReward, small) =>
      "Get ${bigReward} HP for ${big} steps, and ${smallReward} HP for ${small} steps";

  static String m2(hp) => "Keep moving, you got ${hp} HP";

  static String m3(hp, name) => "You bought a ${name} and spent ${hp} HP";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "antonymous_login":
            MessageLookupByLibrary.simpleMessage("Antonymous Login"),
        "app_splash_title":
            MessageLookupByLibrary.simpleMessage("The Duck Is Walking Now!"),
        "app_title":
            MessageLookupByLibrary.simpleMessage("Flutter Steps Tracker"),
        "award_title": m0,
        "big_one": MessageLookupByLibrary.simpleMessage("Big one"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "continue_t": MessageLookupByLibrary.simpleMessage("continue"),
        "email_validation":
            MessageLookupByLibrary.simpleMessage("Enter a valid email"),
        "empty_gifts":
            MessageLookupByLibrary.simpleMessage("There is no gifts yet! 😭"),
        "empty_health_points_history":
            MessageLookupByLibrary.simpleMessage("No redeems 😢"),
        "empty_rank": MessageLookupByLibrary.simpleMessage("Lazy Town!🌚"),
        "empty_redeems_history":
            MessageLookupByLibrary.simpleMessage("There is no gifts yet! 😭"),
        "enter_email": MessageLookupByLibrary.simpleMessage("Enter a email"),
        "enter_name": MessageLookupByLibrary.simpleMessage("Enter your name"),
        "enter_password":
            MessageLookupByLibrary.simpleMessage("Enter a password"),
        "health_points": MessageLookupByLibrary.simpleMessage("Health Points"),
        "health_points_clarify": m1,
        "keep_moving": m2,
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "not_supported_device":
            MessageLookupByLibrary.simpleMessage("Device is not supported!"),
        "now_enough_hp": MessageLookupByLibrary.simpleMessage("No enough HP!"),
        "redeems": MessageLookupByLibrary.simpleMessage("Redeems"),
        "redeems_title": m3,
        "required_validation":
            MessageLookupByLibrary.simpleMessage("This filed is required"),
        "sign_up": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "skip": MessageLookupByLibrary.simpleMessage("Skip"),
        "steps_today": MessageLookupByLibrary.simpleMessage("Your steps today"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome")
      };
}
