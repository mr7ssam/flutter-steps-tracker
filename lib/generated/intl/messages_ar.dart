// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(hp) => "حصلت على ${hp} نقطة صحة";

  static String m1(bigReward, big, smallReward, small) =>
      "احصل على ${bigReward} نقطة صحة من أجل ${big} خطوة، و ${smallReward} نقطة صحة من أجل ${small} خطوة";

  static String m2(hp) => "استمر بالسير، حصلت على ${hp} نقطة صحة";

  static String m3(hp, name) => "اشتريت ${name} واستخدمت ${hp} نقطة صحة";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "antonymous_login":
            MessageLookupByLibrary.simpleMessage("تسجيل بدون حساب"),
        "app_splash_title":
            MessageLookupByLibrary.simpleMessage("البطة تمشي الآن!"),
        "app_title": MessageLookupByLibrary.simpleMessage("متتبع خطوات"),
        "award_title": m0,
        "big_one": MessageLookupByLibrary.simpleMessage("جائزة كبيرة"),
        "cancel": MessageLookupByLibrary.simpleMessage("إالغاء"),
        "continue_t": MessageLookupByLibrary.simpleMessage("التالي"),
        "email_validation":
            MessageLookupByLibrary.simpleMessage("ادخل بريد الكتروني صالح!"),
        "empty_gifts":
            MessageLookupByLibrary.simpleMessage("لا يوجد هدايا بعد! 😭"),
        "empty_health_points_history": MessageLookupByLibrary.simpleMessage(
            "لم تقك بأي غملية استبدال  😢"),
        "empty_rank": MessageLookupByLibrary.simpleMessage("مدينة الكسالى! 🌚"),
        "empty_redeems_history":
            MessageLookupByLibrary.simpleMessage("لم تقم بشراء شيء بعد! 😭"),
        "enter_email":
            MessageLookupByLibrary.simpleMessage("ادخل البريد الابكتروني"),
        "enter_name": MessageLookupByLibrary.simpleMessage("ادخل اسمك"),
        "enter_password":
            MessageLookupByLibrary.simpleMessage("ادخل كلمة المرور"),
        "health_points": MessageLookupByLibrary.simpleMessage("نفاط الصحة"),
        "health_points_clarify": m1,
        "keep_moving": m2,
        "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "not_supported_device":
            MessageLookupByLibrary.simpleMessage("الجهاز ليس مدعوما!"),
        "now_enough_hp":
            MessageLookupByLibrary.simpleMessage("لا يوجد نقاط صحة كافية!"),
        "redeems": MessageLookupByLibrary.simpleMessage("مقايضات"),
        "redeems_title": m3,
        "required_validation":
            MessageLookupByLibrary.simpleMessage("هذا الحقل مطلوب!"),
        "sign_up": MessageLookupByLibrary.simpleMessage("تسجيل حساب"),
        "skip": MessageLookupByLibrary.simpleMessage("تخطي"),
        "steps_today": MessageLookupByLibrary.simpleMessage("خطواتك اليوم"),
        "welcome": MessageLookupByLibrary.simpleMessage("مرحبا")
      };
}
