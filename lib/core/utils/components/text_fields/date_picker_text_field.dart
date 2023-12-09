import 'package:flutter/material.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/components/date_time_picker/date_picker.dart';
import 'package:team_project/core/utils/components/text_fields/enum.dart';
import 'package:team_project/core/utils/components/text_fields/normal_text_field.dart';
import 'package:team_project/core/utils/helper/date_time.dart';

class CustomDatePickerTextField extends StatefulWidget {
  const CustomDatePickerTextField(
      {super.key,
      required this.label,
      this.validator,
      required this.onDatePicked,
      this.initDate,
      this.inputSize = InputSize.small,
      this.onSaved,
      this.isRequired = true, this.controller});

  final String label;
  final String? Function(String?)? validator;
  final Function(DateTime?) onDatePicked;
  final DateTime? initDate;
  final InputSize inputSize;
  final Function(DateTime?)? onSaved;
  final bool isRequired;
  final TextEditingController? controller;

  @override
  State<CustomDatePickerTextField> createState() =>
      _CustomDatePickerTextFieldState();
}

class _CustomDatePickerTextFieldState extends State<CustomDatePickerTextField> {
  TextEditingController? _controller;
  final FocusNode _focusNode = FocusNode();
  final String dateFormat = "MM/dd/y";

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    _controller = widget.controller ?? TextEditingController();
    if (widget.initDate != null) {
      _controller!.text = AppDateTimeHelper.formatDateTime(
          dateTime: widget.initDate!, format: dateFormat);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      initialValue: widget.initDate != null
          ? AppDateTimeHelper.formatDateTime(
              dateTime: widget.initDate!, format: dateFormat)
          : null,
      labelText: widget.label,
      controller: _controller!,
      focusNode: _focusNode,
      readOnly: true,
      onSaved: (text) {
        widget.onSaved?.call(_sToDt(text));
      },
      inputSize: widget.inputSize,
      validator: widget.validator,
      onTap: () => _openDatePicker(),
      suffixConstraints: const BoxConstraints(maxWidth: 32, maxHeight: 24),
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: AppIcon.calendarSquare,
      ),
      contentPadding: const EdgeInsets.fromLTRB(14, 8, 16, 8),
    );
  }

  void _openDatePicker() async {
    DateTime? dateTime = await showCustomDatePicker(context);
    if (dateTime != null) {
      _controller!.text = AppDateTimeHelper.formatDateTime(
          dateTime: dateTime, format: dateFormat);
      widget.onDatePicked.call(dateTime);
    }
  }

  DateTime? _sToDt(String? text) {
    if (text != null) {
      List<String> splitDate = text.split("/");
      int day = int.parse(splitDate[1]);
      int month = int.parse(splitDate[0]);
      int year = int.parse(splitDate[2]);
      return DateTime(year, month, day);
    }
    return null;
  }


}
