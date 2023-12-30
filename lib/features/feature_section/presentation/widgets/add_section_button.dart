import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/features/feature_section/data/model/create_section_request.dart';
import '../../../../core/utils/components/buttons/elevated_button.dart';
import '../../../../core/utils/components/buttons/enums/button_size.dart';
import '../bloc/section_bloc.dart';

class AddSectionButtonWidget extends StatefulWidget {
  String name;
  String description;
  bool disable;
  int parentId = 1;
  String color = '#000000';

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
                color: widget.color,
                name: widget.name,
                description: widget.description,
                parentId: 1));
          },
          buttonSize: ButtonSize.small,
          isExpanded: false,
          disabled: widget.disable),
    );
  }
}
