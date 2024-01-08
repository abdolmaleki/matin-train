import 'package:auto_route/auto_route.dart';
import 'package:team_project/core/utils/routes/router.gr.dart';

/*
Use the [watch] flag to watch the files' system for edits and rebuild as necessary
flutter packages pub run build_runner watch
if you want the generator to run one time and exit, use
flutter packages pub run build_runner build
 */

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: OtpRoute.page),
    AutoRoute(page: TermsPrivacyRoute.page),
    AutoRoute(page: PermissionRoute.page),
  ];
}
