import 'package:flutter/material.dart';
import 'package:hoivalani/core/config/themes/typography.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';

import 'package:hoivalani/core/config/themes/main_them.dart';

final appLightTheme = mainTheme.copyWith(
    ///////////////////////////
    // Secondary text color
    ///////////////////////////
    secondaryHeaderColor: AppColors.gray600,
    cardColor: AppColors.white,
    disabledColor: AppColors.gray500,
    primaryColor: AppColors.primary,
    dividerColor: AppColors.gray500.withOpacity(0.24),
    canvasColor: Colors.white,
    ///////////////////////////
    // Pages' main color
    ///////////////////////////
    scaffoldBackgroundColor: AppColors.white,
    ///////////////////////////
    // Theme for TextFormFields
    ///////////////////////////
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: AppColors.gray500.withOpacity(0.32)),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: AppColors.gray500.withOpacity(0.32)),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColors.error),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColors.error),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      contentPadding: const EdgeInsets.fromLTRB(14, 16, 10, 16),
      errorStyle: AppTypography.caption.apply(
        color: AppColors.error,
      ),
      errorMaxLines: 2,
    ),
    ///////////////////////////
    // Theme for Form's ElevatedButtons
    ///////////////////////////
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            )),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.gray500.withOpacity(0.24);
              } else if (states.contains(MaterialState.pressed)) {
                return AppColors.primaryDark;
              }
              return AppColors.primary;
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.gray500.withOpacity(0.8);
              }
              return AppColors.white;
            }))),
    ///////////////////////////
    // Theme for Form's TextButtons
    ///////////////////////////
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            )),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColors.primary.withOpacity(0.08);
              }
              return AppColors.white;
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.gray500.withOpacity(0.8);
              }
              return AppColors.primary;
            }))),

    ///////////////////////////
    // Theme for Form's OutlineButtons
    ///////////////////////////
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
            side: MaterialStateProperty.resolveWith<BorderSide>((states) {
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(
                    width: 1,
                    color: AppColors.gray500.withOpacity(0.24),
                    style: BorderStyle.solid);
              } else if (states.contains(MaterialState.pressed)) {
                return const BorderSide(
                    width: 1,
                    color: AppColors.primary,
                    style: BorderStyle.solid);
              }
              return BorderSide(
                  width: 1,
                  color: AppColors.primary.withOpacity(0.48),
                  style: BorderStyle.solid);
            }),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColors.primary.withOpacity(0.08);
              }
              return AppColors.white;
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.gray500.withOpacity(0.8);
              }
              return AppColors.primary;
            }))),

    ///////////////////////////
    // Theme for Dividers
    ///////////////////////////
    dividerTheme: DividerThemeData(
      color: AppColors.gray500.withOpacity(0.24),
      thickness: 1,
      space: 0,
      indent: 0,
      endIndent: 0,
    ),

    ///////////////////////////
    // Theme for TabBar
    ///////////////////////////
    tabBarTheme: TabBarTheme(
      indicatorColor: AppColors.primary,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: mainTheme.textTheme.titleSmall,
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.gray600,
      splashFactory: NoSplash.splashFactory,
    ),
    ///////////////////////////
    // Theme for Switch
    ///////////////////////////
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primary;
        }
        return AppColors.gray100;
      }),
      trackColor: MaterialStateProperty.all(AppColors.gray500),
    ),
    ///////////////////////////
    // Theme for Date Picker
    ///////////////////////////
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: AppColors.primaryDark,
      headerForegroundColor: AppColors.white,
      backgroundColor: AppColors.white,
      elevation: 0,
      weekdayStyle: AppTypography.caption.apply(
        color: AppColors.gray500,
      ),
      headerHelpStyle: AppTypography.overline
          .apply(color: AppColors.white.withOpacity(0.72)),
      dayStyle: AppTypography.body2,
      headerHeadlineStyle: AppTypography.h4,
      surfaceTintColor: AppColors.white,
      dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primary;
        }
        return AppColors.white;
      }),
      todayBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primary;
        }
        return AppColors.white;
      }),
    ),
    ///////////////////////////
    // Theme for Time Picker
    ///////////////////////////
    timePickerTheme: TimePickerThemeData(
        backgroundColor: AppColors.white,
        elevation: 0,
        dayPeriodTextColor: AppColors.primary,
        dialBackgroundColor: AppColors.gray500.withOpacity(0.24),
        dialHandColor: AppColors.primary,
        hourMinuteTextColor: AppColors.primary,
        hourMinuteColor: Colors.transparent,
        dayPeriodColor: Colors.transparent),

    ///////////////////////////
    // Theme for Radio Buttons
    ///////////////////////////
    radioTheme:
        RadioThemeData(fillColor: MaterialStateProperty.all(AppColors.primary)),

    ///////////////////////////
    // Theme for CheckBoxes
    ///////////////////////////
    checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(AppColors.primary),
        checkColor: MaterialStateProperty.all(Colors.white)),

    ///////////////////////////
    // Theme for DropDown Button
    ///////////////////////////
    dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: AppTypography.body1,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: AppTypography.body1.apply(color: AppColors.gray500),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1, color: AppColors.gray500.withOpacity(0.32)),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1, color: AppColors.gray500.withOpacity(0.32)),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: AppColors.error),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: AppColors.error),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          errorStyle: AppTypography.caption.apply(
            color: AppColors.error,
          ),
        ),
        menuStyle: MenuStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          surfaceTintColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
        )),
popupMenuTheme: const PopupMenuThemeData(
  color: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(16),
    ),
  ),
  surfaceTintColor: Colors.white
)

);
