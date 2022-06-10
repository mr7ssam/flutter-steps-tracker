import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';
import 'const.dart';
import 'typo.dart';

final kButtonPadding = REdgeInsets.all(LayoutConstrains.m1);
final kChipPadding = REdgeInsets.all(LayoutConstrains.s2);

late final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: AppColors.primarySwatch, brightness: Brightness.dark)
        .copyWith(secondary: AppColors.secondarySwatch.shade400),
    textTheme: textTheme,
    primaryColor: AppColors.primarySwatch.shade500,
    useMaterial3: true,
    floatingActionButtonTheme: _floatingActionButtonTheme,
    textButtonTheme: _textButtonTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    checkboxTheme: _checkboxThemeData,
    chipTheme: _chipTheme,
    appBarTheme: _appBarDarkTheme,
    inputDecorationTheme: _kInputDecoration,
    iconTheme: _kIconTheme.copyWith(color: Colors.white),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(PRadius.container),
          topRight: Radius.circular(PRadius.container),
        ),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(PRadius.container.r),
      ),
    ),
    dialogTheme: DialogTheme(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r))),
    listTileTheme: ListTileThemeData(
      horizontalTitleGap: 0,
      contentPadding: REdgeInsets.symmetric(horizontal: 12),
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Colors.transparent,
      iconTheme: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return IconThemeData(color: AppColors.primarySwatch.shade400);
        }
        return const IconThemeData(color: Colors.grey);
      }),
      height: 50.h,
    ));
final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primarySwatch.shade500,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    useMaterial3: true,
    textTheme: textTheme,
    colorScheme: _colorScheme,
    floatingActionButtonTheme: _floatingActionButtonTheme,
    textButtonTheme: _textButtonTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    checkboxTheme: _checkboxThemeData,
    chipTheme: _chipTheme,
    appBarTheme: _appBarTheme,
    inputDecorationTheme: _kInputDecoration,
    iconTheme: _kIconTheme,
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(PRadius.container),
          topRight: Radius.circular(PRadius.container),
        ),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(PRadius.container.r),
      ),
    ),
    dialogTheme: DialogTheme(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r))),
    listTileTheme: ListTileThemeData(
      horizontalTitleGap: 0,
      contentPadding: REdgeInsets.symmetric(horizontal: 12),
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Colors.transparent,
      iconTheme: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return IconThemeData(color: AppColors.primarySwatch.shade400);
        }
        return null;
      }),
      height: 50.h,
    ));
final _borderWidth = 1.r;
final _inputBorderRadius = BorderRadius.circular(PRadius.texFiled).r;
final _kInputDecoration = InputDecorationTheme(
  contentPadding: REdgeInsets.symmetric(vertical: 14, horizontal: 14),
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide:
        BorderSide(width: _borderWidth, color: AppColors.textFieldBorder),
    borderRadius: _inputBorderRadius,
  ),
  border: OutlineInputBorder(
    borderSide:
        BorderSide(width: _borderWidth, color: AppColors.textFieldBorder),
    borderRadius: _inputBorderRadius,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
        width: _borderWidth, color: AppColors.primarySwatch.shade500),
    borderRadius: _inputBorderRadius,
  ),
  errorBorder: OutlineInputBorder(
    borderSide:
        BorderSide(width: _borderWidth, color: AppColors.errorSwatch.shade400),
    borderRadius: _inputBorderRadius,
  ),
  disabledBorder: OutlineInputBorder(
    borderSide:
        BorderSide(width: _borderWidth, color: AppColors.textFieldBorder),
    borderRadius: _inputBorderRadius,
  ),
);

final _kIconTheme = IconThemeData(size: 20.r);

final _textButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    padding: kButtonPadding,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(PRadius.button.r),
    ),
  ),
);

final _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    padding: kButtonPadding,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(PRadius.button.r),
    ),
  ),
);

final _outlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    padding: kButtonPadding,
    side: BorderSide(color: AppColors.primarySwatch.shade400),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(PRadius.button.r),
    ),
  ),
);

final _floatingActionButtonTheme = FloatingActionButtonThemeData(
  backgroundColor: AppColors.primarySwatch.shade500,
  foregroundColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(PRadius.floatingButton.r),
  ),
);

final _colorScheme = ColorScheme.fromSwatch(
  primarySwatch: AppColors.primarySwatch,
  accentColor: AppColors.secondarySwatch.shade400,
).copyWith(
  onPrimaryContainer: AppColors.primarySwatch.shade400,
  primaryContainer: AppColors.primarySwatch.shade50,
);

final _checkboxThemeData = CheckboxThemeData(
  fillColor: MaterialStateProperty.all(AppColors.primarySwatch),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(PRadius.checkBox.r),
  ),
);

final _chipTheme = ChipThemeData(
  padding: kChipPadding,
  selectedColor: AppColors.primarySwatch.shade50,
  backgroundColor: Colors.transparent,
  checkmarkColor: AppColors.primarySwatch.shade400,
  shape: RoundedRectangleBorder(
    side: BorderSide(
      width: 1.r,
    ),
    borderRadius: BorderRadius.circular(PRadius.chip.r),
  ),
);

const _appBarTheme = AppBarTheme(
  color: Colors.transparent,
  elevation: 0,
  foregroundColor: Colors.black,
  iconTheme: IconThemeData(color: Colors.black),
);

const _appBarDarkTheme = AppBarTheme(
  color: Colors.transparent,
  foregroundColor: Colors.white,
  elevation: 0,
);
