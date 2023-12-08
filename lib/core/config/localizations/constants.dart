import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


const customLocalizationDelegates=[
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,

];

const customSupportedLocales=[
  Locale('en'),
  Locale('fi'),
  Locale('sv'),
];

AppLocalizations? appIntl;