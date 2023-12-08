import 'package:flutter/material.dart';
import 'package:hoivalani/core/config/localizations/constants.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: appIntl!.poweredBy,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(
                  color: Theme.of(context)
                      .secondaryHeaderColor)),
          const TextSpan(text: " "),
          TextSpan(
              text: appIntl!.hoiTekFi,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: AppColors.secondary)),
        ],
      ),
    );
  }
}
