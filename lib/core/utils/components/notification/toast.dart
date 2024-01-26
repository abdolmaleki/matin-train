import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/components/notification/enums/toast_type.dart';
import 'package:team_project/core/utils/constants/keys/global_keys.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class CustomToast {
  static void show(
      {BuildContext? context,
      required String message,
      required ToastType toastType}) {
    Timer? timer;
    showDialog(
        context: context ?? masterLayoutScaffoldKey.currentContext!,
        barrierColor: Colors.transparent,
        builder: (context) {
          timer = Timer(const Duration(seconds: 3), () {
            context.router.pop();
          });
          return Wrap(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(12, 12, 4, 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x28919EAB),
                        blurRadius: 16,
                        offset: Offset(0, 8),
                        spreadRadius: 0,
                      ),
                    ]),
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(36, 16, 20, 0),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: _getIconBackgroundColor(toastType),
                          borderRadius: BorderRadius.circular(12)),
                      child: _getIcon(toastType),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Text(
                        message,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (timer!.isActive) {
                          timer!.cancel();
                        }
                        context.router.pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppIcon.close,
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }).then((value) {
      if (timer!.isActive) {
        timer!.cancel();
      }
    });
  }

  static void showWithDelay(
      {BuildContext? context,
      required String message,
      required ToastType toastType}) {
    Future.delayed(const Duration(milliseconds: 100), () {
      CustomToast.show(
          message: message,
          context: masterLayoutScaffoldKey.currentContext!,
          toastType: toastType);
    });
  }

  static Color _getIconBackgroundColor(ToastType toastType) {
    switch (toastType) {
      case ToastType.success:
        return AppColors.success.withOpacity(0.16);
      case ToastType.error:
        return AppColors.error.withOpacity(0.16);
      case ToastType.warning:
        return AppColors.warning.withOpacity(0.16);
      case ToastType.info:
        return AppColors.info.withOpacity(0.16);
    }
  }

  static Widget _getIcon(ToastType toastType) {
    switch (toastType) {
      case ToastType.success:
        return AppIcon.success;
      case ToastType.error:
        return AppIcon.error;
      case ToastType.warning:
        return AppIcon.warning;
      case ToastType.info:
        return AppIcon.info;
    }
  }
}
