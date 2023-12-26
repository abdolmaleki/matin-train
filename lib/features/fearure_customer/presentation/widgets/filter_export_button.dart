import 'package:flutter/material.dart';
import 'package:team_project/core/utils/components/containers/bottom_sheet/titled_bottom_sheet.dart';
import 'package:team_project/core/utils/components/drop_down/drop_down_item.dart';

import '../../../../core/utils/assets/app_svg.dart';
import '../../../../core/utils/components/text_fields/search_debounce_text_field.dart';
import 'custom_button.dart';

class FilterExportWidget extends StatelessWidget {
   FilterExportWidget({super.key});
  TextEditingController? controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomButtonWidget(
          onPressed: () {

          },
          icon: AppIcon.filter,
          label: 'Filters',
        )),
        const SizedBox(
          width: 16,
        ),
        Expanded(
            child: CustomButtonWidget(
          onPressed: () {},
          icon: AppIcon.export,
          label: 'Export',
        )),
      ],
    );
  }
}
