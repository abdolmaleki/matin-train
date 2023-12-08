// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i30;
import 'package:flutter/material.dart' as _i31;
import 'package:hoivalani/features/feature_add_report/presentation/pages/add_report.dart'
    as _i1;
import 'package:hoivalani/features/feature_auth/presentation/pages/change_password_page.dart'
    as _i2;
import 'package:hoivalani/features/feature_auth/presentation/pages/login_page.dart'
    as _i3;
import 'package:hoivalani/features/feature_auth/presentation/pages/otp_page.dart'
    as _i4;
import 'package:hoivalani/features/feature_auth/presentation/pages/reset_password_email.dart'
    as _i5;
import 'package:hoivalani/features/feature_auth/presentation/pages/reset_password_set_new.dart'
    as _i6;
import 'package:hoivalani/features/feature_auth/presentation/pages/term_privacy_page.dart'
    as _i7;
import 'package:hoivalani/features/feature_customer/presentation/pages/create_customer.dart'
    as _i8;
import 'package:hoivalani/features/feature_customer/presentation/pages/view_all_customer.dart'
    as _i9;
import 'package:hoivalani/features/feature_cycle/presentation/pages/cycle.dart'
    as _i10;
import 'package:hoivalani/features/feature_dashboard/presentation/pages/dashboard.dart'
    as _i11;
import 'package:hoivalani/features/feature_equipment/presentation/pages/equipment.dart'
    as _i12;
import 'package:hoivalani/features/feature_home/presentation/pages/home_page.dart'
    as _i13;
import 'package:hoivalani/features/feature_keikkala/presentation/pages/keikkala.dart'
    as _i14;
import 'package:hoivalani/features/feature_language_skill/presentation/pages/language_skill.dart'
    as _i15;
import 'package:hoivalani/features/feature_license/presentation/pages/license.dart'
    as _i16;
import 'package:hoivalani/features/feature_limitation/presentation/pages/limitation.dart'
    as _i17;
import 'package:hoivalani/features/feature_motivation/presentation/pages/motivition.dart'
    as _i18;
import 'package:hoivalani/features/feature_notification/presentation/pages/notification_page.dart'
    as _i19;
import 'package:hoivalani/features/feature_permission/presentation/pages/permission.dart'
    as _i20;
import 'package:hoivalani/features/feature_profile/presentation/pages/profile.dart'
    as _i21;
import 'package:hoivalani/features/feature_quiz/presentation/pages/quiz.dart'
    as _i22;
import 'package:hoivalani/features/feature_splash/presentation/pages/splash_page.dart'
    as _i23;
import 'package:hoivalani/features/feature_staff/presentation/pages/create_staff.dart'
    as _i24;
import 'package:hoivalani/features/feature_staff/presentation/pages/view_all_staff.dart'
    as _i25;
import 'package:hoivalani/features/feature_staff_club/presentation/pages/staff_club.dart'
    as _i26;
import 'package:hoivalani/features/feature_ticket/presentation/pages/ticket.dart'
    as _i27;
import 'package:hoivalani/features/feature_todo/presentation/pages/todo_page.dart'
    as _i28;
import 'package:hoivalani/features/feature_transportation/presentation/pages/transportation.dart'
    as _i29;

abstract class $AppRouter extends _i30.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i30.PageFactory> pagesMap = {
    AddReportRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddReportPage(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ChangePasswordPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.OtpPage(
          key: args.key,
          enteredEmail: args.enteredEmail,
          token: args.token,
          email: args.email,
          password: args.password,
        ),
      );
    },
    ResetPasswordEmailRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ResetPasswordEmailPage(),
      );
    },
    ResetPasswordSetNewRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ResetPasswordSetNewPage(),
      );
    },
    TermsPrivacyRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.TermsPrivacyPage(),
      );
    },
    CreateCustomerRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.CreateCustomerPage(),
      );
    },
    ViewAllCustomerRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ViewAllCustomerPage(),
      );
    },
    CyclesRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.CyclesPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.DashboardPage(),
      );
    },
    EquipmentRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.EquipmentPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.HomePage(),
      );
    },
    KeikkalaRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.KeikkalaPage(),
      );
    },
    LanguageSkillRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.LanguageSkillPage(),
      );
    },
    LicenseRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.LicensePage(),
      );
    },
    LimitationRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.LimitationPage(),
      );
    },
    MotivationRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.MotivationPage(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.NotificationPage(),
      );
    },
    RolePermissionRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.RolePermissionPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.ProfilePage(),
      );
    },
    QuizRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.QuizPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.SplashPage(),
      );
    },
    CreateStaffRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.CreateStaffPage(),
      );
    },
    ViewAllStaffRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.ViewAllStaffPage(),
      );
    },
    StaffClubRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.StaffClubPage(),
      );
    },
    TicketRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.TicketPage(),
      );
    },
    TodoRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.TodoPage(),
      );
    },
    TransportationRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.TransportationPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddReportPage]
class AddReportRoute extends _i30.PageRouteInfo<void> {
  const AddReportRoute({List<_i30.PageRouteInfo>? children})
      : super(
          AddReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddReportRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChangePasswordPage]
class ChangePasswordRoute extends _i30.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i30.PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i30.PageRouteInfo<void> {
  const LoginRoute({List<_i30.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i4.OtpPage]
class OtpRoute extends _i30.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i31.Key? key,
    required String enteredEmail,
    required String token,
    String? email,
    String? password,
    List<_i30.PageRouteInfo>? children,
  }) : super(
          OtpRoute.name,
          args: OtpRouteArgs(
            key: key,
            enteredEmail: enteredEmail,
            token: token,
            email: email,
            password: password,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const _i30.PageInfo<OtpRouteArgs> page =
      _i30.PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.enteredEmail,
    required this.token,
    this.email,
    this.password,
  });

  final _i31.Key? key;

  final String enteredEmail;

  final String token;

  final String? email;

  final String? password;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, enteredEmail: $enteredEmail, token: $token, email: $email, password: $password}';
  }
}

/// generated route for
/// [_i5.ResetPasswordEmailPage]
class ResetPasswordEmailRoute extends _i30.PageRouteInfo<void> {
  const ResetPasswordEmailRoute({List<_i30.PageRouteInfo>? children})
      : super(
          ResetPasswordEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordEmailRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ResetPasswordSetNewPage]
class ResetPasswordSetNewRoute extends _i30.PageRouteInfo<void> {
  const ResetPasswordSetNewRoute({List<_i30.PageRouteInfo>? children})
      : super(
          ResetPasswordSetNewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordSetNewRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i7.TermsPrivacyPage]
class TermsPrivacyRoute extends _i30.PageRouteInfo<void> {
  const TermsPrivacyRoute({List<_i30.PageRouteInfo>? children})
      : super(
          TermsPrivacyRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsPrivacyRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i8.CreateCustomerPage]
class CreateCustomerRoute extends _i30.PageRouteInfo<void> {
  const CreateCustomerRoute({List<_i30.PageRouteInfo>? children})
      : super(
          CreateCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateCustomerRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ViewAllCustomerPage]
class ViewAllCustomerRoute extends _i30.PageRouteInfo<void> {
  const ViewAllCustomerRoute({List<_i30.PageRouteInfo>? children})
      : super(
          ViewAllCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'ViewAllCustomerRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i10.CyclesPage]
class CyclesRoute extends _i30.PageRouteInfo<void> {
  const CyclesRoute({List<_i30.PageRouteInfo>? children})
      : super(
          CyclesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CyclesRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i11.DashboardPage]
class DashboardRoute extends _i30.PageRouteInfo<void> {
  const DashboardRoute({List<_i30.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i12.EquipmentPage]
class EquipmentRoute extends _i30.PageRouteInfo<void> {
  const EquipmentRoute({List<_i30.PageRouteInfo>? children})
      : super(
          EquipmentRoute.name,
          initialChildren: children,
        );

  static const String name = 'EquipmentRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i13.HomePage]
class HomeRoute extends _i30.PageRouteInfo<void> {
  const HomeRoute({List<_i30.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i14.KeikkalaPage]
class KeikkalaRoute extends _i30.PageRouteInfo<void> {
  const KeikkalaRoute({List<_i30.PageRouteInfo>? children})
      : super(
          KeikkalaRoute.name,
          initialChildren: children,
        );

  static const String name = 'KeikkalaRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i15.LanguageSkillPage]
class LanguageSkillRoute extends _i30.PageRouteInfo<void> {
  const LanguageSkillRoute({List<_i30.PageRouteInfo>? children})
      : super(
          LanguageSkillRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageSkillRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i16.LicensePage]
class LicenseRoute extends _i30.PageRouteInfo<void> {
  const LicenseRoute({List<_i30.PageRouteInfo>? children})
      : super(
          LicenseRoute.name,
          initialChildren: children,
        );

  static const String name = 'LicenseRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i17.LimitationPage]
class LimitationRoute extends _i30.PageRouteInfo<void> {
  const LimitationRoute({List<_i30.PageRouteInfo>? children})
      : super(
          LimitationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LimitationRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i18.MotivationPage]
class MotivationRoute extends _i30.PageRouteInfo<void> {
  const MotivationRoute({List<_i30.PageRouteInfo>? children})
      : super(
          MotivationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MotivationRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i19.NotificationPage]
class NotificationRoute extends _i30.PageRouteInfo<void> {
  const NotificationRoute({List<_i30.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i20.RolePermissionPage]
class RolePermissionRoute extends _i30.PageRouteInfo<void> {
  const RolePermissionRoute({List<_i30.PageRouteInfo>? children})
      : super(
          RolePermissionRoute.name,
          initialChildren: children,
        );

  static const String name = 'RolePermissionRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i21.ProfilePage]
class ProfileRoute extends _i30.PageRouteInfo<void> {
  const ProfileRoute({List<_i30.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i22.QuizPage]
class QuizRoute extends _i30.PageRouteInfo<void> {
  const QuizRoute({List<_i30.PageRouteInfo>? children})
      : super(
          QuizRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuizRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SplashPage]
class SplashRoute extends _i30.PageRouteInfo<void> {
  const SplashRoute({List<_i30.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i24.CreateStaffPage]
class CreateStaffRoute extends _i30.PageRouteInfo<void> {
  const CreateStaffRoute({List<_i30.PageRouteInfo>? children})
      : super(
          CreateStaffRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateStaffRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i25.ViewAllStaffPage]
class ViewAllStaffRoute extends _i30.PageRouteInfo<void> {
  const ViewAllStaffRoute({List<_i30.PageRouteInfo>? children})
      : super(
          ViewAllStaffRoute.name,
          initialChildren: children,
        );

  static const String name = 'ViewAllStaffRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i26.StaffClubPage]
class StaffClubRoute extends _i30.PageRouteInfo<void> {
  const StaffClubRoute({List<_i30.PageRouteInfo>? children})
      : super(
          StaffClubRoute.name,
          initialChildren: children,
        );

  static const String name = 'StaffClubRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i27.TicketPage]
class TicketRoute extends _i30.PageRouteInfo<void> {
  const TicketRoute({List<_i30.PageRouteInfo>? children})
      : super(
          TicketRoute.name,
          initialChildren: children,
        );

  static const String name = 'TicketRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i28.TodoPage]
class TodoRoute extends _i30.PageRouteInfo<void> {
  const TodoRoute({List<_i30.PageRouteInfo>? children})
      : super(
          TodoRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i29.TransportationPage]
class TransportationRoute extends _i30.PageRouteInfo<void> {
  const TransportationRoute({List<_i30.PageRouteInfo>? children})
      : super(
          TransportationRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransportationRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}
