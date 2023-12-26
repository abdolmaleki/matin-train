// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:team_project/features/feature_auth/presentation/pages/login_page.dart'
    as _i1;
import 'package:team_project/features/feature_auth/presentation/pages/otp_page.dart'
    as _i3;
import 'package:team_project/features/feature_auth/presentation/pages/term_privacy_page.dart'
    as _i6;
import 'package:team_project/features/feature_medicine/presentation/pages/medicine_page.dart'
    as _i2;
import 'package:team_project/features/feature_section/presentation/pages/section_page.dart'
    as _i4;
import 'package:team_project/features/feature_splash/presentation/pages/splash_page.dart'
    as _i5;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    MedicineRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MedicinePage(),
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.OtpPage(
          key: args.key,
          enteredEmail: args.enteredEmail,
          token: args.token,
          email: args.email,
          password: args.password,
        ),
      );
    },
    SectionRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SectionPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashPage(),
      );
    },
    TermsPrivacyRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.TermsPrivacyPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MedicinePage]
class MedicineRoute extends _i7.PageRouteInfo<void> {
  const MedicineRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MedicineRoute.name,
          initialChildren: children,
        );

  static const String name = 'MedicineRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.OtpPage]
class OtpRoute extends _i7.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i8.Key? key,
    required String enteredEmail,
    required String token,
    String? email,
    String? password,
    List<_i7.PageRouteInfo>? children,
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

  static const _i7.PageInfo<OtpRouteArgs> page =
      _i7.PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.enteredEmail,
    required this.token,
    this.email,
    this.password,
  });

  final _i8.Key? key;

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
/// [_i4.SectionPage]
class SectionRoute extends _i7.PageRouteInfo<void> {
  const SectionRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SectionRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.TermsPrivacyPage]
class TermsPrivacyRoute extends _i7.PageRouteInfo<void> {
  const TermsPrivacyRoute({List<_i7.PageRouteInfo>? children})
      : super(
          TermsPrivacyRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsPrivacyRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
