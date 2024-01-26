import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/config/dependency_injection/get_it.dart';
import 'package:team_project/core/config/localizations/constants.dart';
import 'package:team_project/core/config/themes/dark_theme.dart';
import 'package:team_project/core/config/themes/light_theme.dart';
import 'package:team_project/core/utils/constants/shared_preferences_keys.dart';
import 'package:team_project/core/utils/routes/router.dart';
import 'package:team_project/features/feature_auth/presentation/bloc/auth_bloc.dart';
import 'package:team_project/features/feature_root/domain/usecase/application_usecases.dart';
import 'package:team_project/features/feature_root/presentation/bloc/root_bloc.dart';
import 'package:team_project/features/feature_root/presentation/bloc/root_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final _appRouter = AppRouter();
  Locale? _locale;

  @override
  void initState() {
    _initConfiguration();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RootBloc(ApplicationUseCases()),
          ),
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
        ],
        child: BlocBuilder<RootBloc, RootState>(
          builder: (context, state) {
            if (state is ApplicationConfigChangeState) {
              _locale = state.locale;
            }
            return MaterialApp.router(
              localizationsDelegates: customLocalizationDelegates,
              supportedLocales: customSupportedLocales,
              locale: _locale,
              debugShowCheckedModeBanner: false,
              routerConfig: _appRouter.config(),
              theme: appLightTheme,
              darkTheme: appDarkTheme,
              themeMode: ThemeMode.light,
            );
          },
        ));
  }

  void _initConfiguration() {
    SharedPreferences sharedPreferences = getIt.get<SharedPreferences>();
    _locale = Locale(
        sharedPreferences.getString(SharedPreferencesKey.appLanguage) ?? "en");
  }
}
