import 'package:flutter/material.dart';

abstract class RootState {}

class ApplicationInitializeState extends RootState {}

class ApplicationConfigChangeState extends RootState {
  Locale locale;
  ApplicationConfigChangeState({required this.locale});
}
