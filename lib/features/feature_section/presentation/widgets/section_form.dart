import 'package:flutter/material.dart';
import 'package:team_project/core/utils/architecture/data/common_models/section.dart';
import 'package:team_project/core/utils/components/divider/titled_divider.dart';
import 'package:team_project/core/utils/components/form/form.dart';
import 'package:team_project/core/utils/components/text_fields/color_picker_text_field.dart';
import 'package:team_project/core/utils/components/text_fields/normal_text_field.dart';
import 'package:team_project/core/utils/components/text_fields/text_area.dart';
import 'package:team_project/features/feature_section/presentation/widgets/add_section_button.dart';

class SectionFormWidget extends StatefulWidget {
  const SectionFormWidget({super.key});

  @override
  State<SectionFormWidget> createState() => _SectionFormWidgetState();
}

class _SectionFormWidgetState extends State<SectionFormWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<SectionModel> section = [];

  bool disable = true;
  final key = GlobalKey<FormState>();
  Color currentColor = Colors.green;

  @override
  void initState() {
    isDisable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomForm(
        formKey: key,
        child: Expanded(
          child: ListView(
            children: [
              CustomTextFormField(
                labelText: 'Title',
                controller: titleController,
                onChanged: (value) {
                  isDisable();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomColorPickerTextField(
                onChanged: (value) {
                  isDisable();
                },
                label: 'color',
                controller: colorController,
                currentColor: currentColor,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextArea(
                label: 'Description',
                controller: descriptionController,
              ),
              const SizedBox(
                height: 16,
              ),
              AddSectionButtonWidget(
                  title: titleController.text,
                  description: descriptionController.text,
                  disable: disable),
              const SizedBox(
                height: 16,
              ),
              const CustomTitledDivider('Sections'),
            ],
          ),
        ));
  }

  void isDisable() {
    if (colorController.text.isNotEmpty && titleController.text.isNotEmpty) {
      setState(() {
        disable = false;
      });
    } else {
      setState(() {
        disable = true;
      });
    }
  }
}
