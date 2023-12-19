import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project/core/utils/architecture/data/common_models/section.dart';
import 'package:team_project/features/feature_section/presentation/widgets/section_form.dart';

import '../../../../core/utils/components/buttons/elevated_button.dart';
import '../../../../core/utils/components/buttons/enums/button_size.dart';
import '../bloc/section_bloc.dart';

class AddSectionButtonWidget extends StatefulWidget {
  String title;
  String description;
  bool disable;
   AddSectionButtonWidget({super.key,required this.title,required this.description,required this.disable});

  @override
  State<AddSectionButtonWidget> createState() => _AddSectionButtonWidgetState();
}

class _AddSectionButtonWidgetState extends State<AddSectionButtonWidget> {
  final sectionFormWidget = const SectionFormWidget();
  int number = 0;
  bool disable=true;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: CustomElevatedButton(
          label: 'add',
          onPressed: () {
            setState(() {
              number++;
            });
            context.read<SectionBloc>().addSection(SectionModel(
                number: number,
                title:widget.title ,
                description: widget.description,
                color: Colors.grey));
          },
          buttonSize: ButtonSize.small,
          isExpanded: false,
          disabled: widget.disable),
    );
  }
}
