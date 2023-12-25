import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/architecture/data/common_models/section.dart';
import 'package:team_project/features/feature_section/data/model/create_section_request.dart';
import 'package:team_project/features/feature_section/data/model/get_section_response.dart';
import 'package:team_project/features/feature_section/presentation/widgets/section_form.dart';

import '../../../../core/utils/components/buttons/elevated_button.dart';
import '../../../../core/utils/components/buttons/enums/button_size.dart';
import '../bloc/section_bloc.dart';

class AddSectionButtonWidget extends StatefulWidget {
  String name;
  String description;
  bool disable;
  String color;

  AddSectionButtonWidget(
      {super.key,
      required this.name,
      required this.description,
      required this.disable,
      required this.color});

  @override
  State<AddSectionButtonWidget> createState() => _AddSectionButtonWidgetState();
}

class _AddSectionButtonWidgetState extends State<AddSectionButtonWidget> {
  int number = 1;
  bool disable = true;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: CustomElevatedButton(
          label: 'Add',
          onPressed: () {
            context.read<SectionBloc>().addSection(CreateSectionRequest(
                color: "#000000",
                name: widget.name,
                description: widget.description,
                parentId: null));
          },
          buttonSize: ButtonSize.small,
          isExpanded: false,
          disabled: widget.disable),
    );
  }
}
