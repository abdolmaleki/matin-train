import 'package:flutter/material.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: "poweredBy",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(
                  color: Theme.of(context)
                      .secondaryHeaderColor)),
          const TextSpan(text: " "),
          TextSpan(
              text: "hoiTekFi",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: AppColors.secondary)),
        ],
      ),
    );
  }
}
