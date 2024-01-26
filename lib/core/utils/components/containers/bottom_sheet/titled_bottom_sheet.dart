import 'package:flutter/material.dart';
import 'package:team_project/core/config/themes/typography.dart';
import 'package:team_project/core/utils/constants/keys/global_keys.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

Future<T?> showCustomTitledBottomSheet<T>(
    {required String title,
    required Widget child,
    bool isScrollControlled = false}) {
  return showModalBottomSheet(
      context: masterLayoutScaffoldKey.currentContext!,
      isScrollControlled: isScrollControlled,
      builder: (builder) => SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(masterLayoutScaffoldKey.currentContext!)
                    .viewInsets
                    .bottom),
            child: Container(
              color: Colors.transparent,
              //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0)),
                            color: AppColors.gray500.withOpacity(0.24)),
                        child: Center(
                          child: Text(
                            title,
                            style: AppTypography.buttonSmall,
                          ),
                        ),
                      ),
                      child,
                    ],
                  )),
            ),
          ));
}
