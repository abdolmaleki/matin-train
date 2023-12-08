import 'package:auto_route/auto_route.dart';
import 'package:hoivalani/core/utils/routes/router.gr.dart';

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
        AutoRoute(page: ResetPasswordEmailRoute.page),
        AutoRoute(page: OtpRoute.page),
        AutoRoute(page: ResetPasswordSetNewRoute.page),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: TermsPrivacyRoute.page),
        AutoRoute(page: HomeRoute.page, children: [
          AutoRoute(page: DashboardRoute.page, initial: true),
          AutoRoute(page: ProfileRoute.page),
          AutoRoute(
            page: NotificationRoute.page,
          ),
          AutoRoute(page: TodoRoute.page),
          AutoRoute(page: CyclesRoute.page),
          AutoRoute(page: CreateStaffRoute.page),
          AutoRoute(page: ViewAllStaffRoute.page),
          AutoRoute(page: ViewAllCustomerRoute.page),
          AutoRoute(page: CreateCustomerRoute.page),
          AutoRoute(page: TransportationRoute.page),
          AutoRoute(page: LimitationRoute.page),
          AutoRoute(page: EquipmentRoute.page),
          AutoRoute(page: LanguageSkillRoute.page),
          AutoRoute(page: LicenseRoute.page),
          AutoRoute(page: AddReportRoute.page),
          AutoRoute(page: MotivationRoute.page),
          AutoRoute(page: RolePermissionRoute.page),
          AutoRoute(page: TicketRoute.page),
          AutoRoute(
            page: StaffClubRoute.page,
          ),
          AutoRoute(
            page: QuizRoute.page,
          ),
          AutoRoute(
            page: KeikkalaRoute.page,
          ),
        ])
      ];
}
