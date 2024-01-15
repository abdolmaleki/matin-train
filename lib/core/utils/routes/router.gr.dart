// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:team_project/features/feature_auth/presentation/pages/login_page.dart'
    as _i1;
import 'package:team_project/features/feature_auth/presentation/pages/otp_page.dart'
    as _i2;
import 'package:team_project/features/feature_auth/presentation/pages/term_privacy_page.dart'
    as _i5;
import 'package:team_project/features/feature_permissions/presentation/pages/permissions_page.dart'
    as _i3;
import 'package:team_project/features/feature_splash/presentation/pages/splash_page.dart'
    as _i4;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.OtpPage(
          key: args.key,
          enteredEmail: args.enteredEmail,
          token: args.token,
          email: args.email,
          password: args.password,
        ),
      );
    },
    PermissionsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PermissionsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashPage(),
      );
    },
    TermsPrivacyRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TermsPrivacyPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.OtpPage]
class OtpRoute extends _i6.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i7.Key? key,
    required String enteredEmail,
    required String token,
    String? email,
    String? password,
    List<_i6.PageRouteInfo>? children,
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

  static const _i6.PageInfo<OtpRouteArgs> page =
      _i6.PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.enteredEmail,
    required this.token,
    this.email,
    this.password,
  });

  final _i7.Key? key;

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
/// [_i3.PermissionsPage]
class PermissionsRoute extends _i6.PageRouteInfo<void> {
  const PermissionsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PermissionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PermissionsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TermsPrivacyPage]
class TermsPrivacyRoute extends _i6.PageRouteInfo<void> {
  const TermsPrivacyRoute({List<_i6.PageRouteInfo>? children})
      : super(
          TermsPrivacyRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsPrivacyRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
