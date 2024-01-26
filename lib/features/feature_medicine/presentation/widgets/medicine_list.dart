import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MedicineList extends StatelessWidget {
  final int id;
  final String name;
  final String availability;
  final String manufacturer;
  final String code;

  const MedicineList(
      {super.key,
      required this.id,
      required this.manufacturer,
      required this.availability,
      required this.code,
      required this.name});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xffC4CDD5)),
              child: Center(
                child: Text(
                  '$id',
                  style: theme.textTheme.titleSmall,
                ),
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                    'lib/core/utils/assets/images/ic_edit_outlined.svg'),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset('lib/core/utils/assets/images/ic_trash.svg'),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset(
                    'lib/core/utils/assets/images/ic_info_outlined.svg'),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Name:',
              style: theme.textTheme.bodyMedium,
            ),
            Text(
              name,
              style: theme.textTheme.bodyMedium!
                  .apply(color: const Color(0xff637381)),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Code:',
              style: theme.textTheme.bodyMedium,
            ),
            Text(
              '#$code',
              style: theme.textTheme.bodyMedium!
                  .apply(color: const Color(0xff637381)),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Availability:',
              style: theme.textTheme.bodyMedium,
            ),
            Text(
              availability,
              style: theme.textTheme.bodyMedium!
                  .apply(color: const Color(0xff637381)),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Manufacturer:',
              style: theme.textTheme.bodyMedium,
            ),
            Text(
              manufacturer,
              style: theme.textTheme.bodyMedium!
                  .apply(color: const Color(0xff637381)),
            ),
          ],
        ),
      ],
    );
  }
}
