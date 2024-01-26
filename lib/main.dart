import 'dart:io';

import 'package:flutter/material.dart';
import 'package:team_project/core/config/config/https/https_handler.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/features/feature_root/presentation/pages/root_page.dart';

void main() async {
  await preLaunchConfig();
  runApp(const RootPage());
}

Future preLaunchConfig() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Init getIt
  await initLocator();
  // Config Https
  HttpOverrides.global = MyHttpOverrides();
  return;
}

