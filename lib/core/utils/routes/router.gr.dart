// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:team_project/features/fearure_customer/presentation/pages/customer_page.dart'
    as _i2;
import 'package:team_project/features/feature_auth/presentation/pages/login_page.dart'
    as _i4;
import 'package:team_project/features/feature_auth/presentation/pages/otp_page.dart'
    as _i6;
import 'package:team_project/features/feature_auth/presentation/pages/term_privacy_page.dart'
    as _i10;
import 'package:team_project/features/feature_dashboard/presentation/pages/dashboard_page.dart'
    as _i3;
import 'package:team_project/features/feature_medicine/presentation/pages/create_medicine_page.dart'
    as _i1;
import 'package:team_project/features/feature_medicine/presentation/pages/medicine_page.dart'
    as _i5;
import 'package:team_project/features/feature_section/presentation/pages/section_page.dart'
    as _i7;
import 'package:team_project/features/feature_splash/presentation/pages/splash_page.dart'
    as _i8;
import 'package:team_project/features/feature_staff/presentation/pages/staff_page.dart'
    as _i9;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    CreateMedicineRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CreateMedicinePage(),
      );
    },
    CustomerRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CustomerPage(),
      );
    },
    DashBoardRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashBoardPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    MedicineRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MedicinePage(),
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.OtpPage(
          key: args.key,
          enteredEmail: args.enteredEmail,
          token: args.token,
          email: args.email,
          password: args.password,
        ),
      );
    },
    SectionRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SectionPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SplashPage(),
      );
    },
    StaffRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.StaffPage(),
      );
    },
    TermsPrivacyRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.TermsPrivacyPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CreateMedicinePage]
class CreateMedicineRoute extends _i11.PageRouteInfo<void> {
  const CreateMedicineRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CreateMedicineRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateMedicineRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CustomerPage]
class CustomerRoute extends _i11.PageRouteInfo<void> {
  const CustomerRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DashBoardPage]
class DashBoardRoute extends _i11.PageRouteInfo<void> {
  const DashBoardRoute({List<_i11.PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MedicinePage]
class MedicineRoute extends _i11.PageRouteInfo<void> {
  const MedicineRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MedicineRoute.name,
          initialChildren: children,
        );

  static const String name = 'MedicineRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OtpPage]
class OtpRoute extends _i11.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i12.Key? key,
    required String enteredEmail,
    required String token,
    String? email,
    String? password,
    List<_i11.PageRouteInfo>? children,
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

  static const _i11.PageInfo<OtpRouteArgs> page =
      _i11.PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.enteredEmail,
    required this.token,
    this.email,
    this.password,
  });

  final _i12.Key? key;

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
/// [_i7.SectionPage]
class SectionRoute extends _i11.PageRouteInfo<void> {
  const SectionRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SectionRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SplashPage]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.StaffPage]
class StaffRoute extends _i11.PageRouteInfo<void> {
  const StaffRoute({List<_i11.PageRouteInfo>? children})
      : super(
          StaffRoute.name,
          initialChildren: children,
        );

  static const String name = 'StaffRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TermsPrivacyPage]
class TermsPrivacyRoute extends _i11.PageRouteInfo<void> {
  const TermsPrivacyRoute({List<_i11.PageRouteInfo>? children})
      : super(
          TermsPrivacyRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsPrivacyRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
