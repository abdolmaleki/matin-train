import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/assets/app_svg.dart';
import 'package:hoivalani/core/utils/components/date_time_picker/timer_picker.dart';
import 'package:hoivalani/core/utils/components/text_fields/enum.dart';
import 'package:hoivalani/core/utils/components/text_fields/normal_text_field.dart';
import 'package:hoivalani/core/utils/helper/date_time.dart';

class CustomTimePickerTextField extends StatefulWidget {
  const CustomTimePickerTextField(
      {super.key,
      required this.label,
      this.validator,
      required this.onTimePicked,
      this.initTime,
      this.inputSize = InputSize.small,
      this.onSaved,
      this.isRequired = true, this.controller});

  final String label;
  final String? Function(String?)? validator;
  final Function(TimeOfDay?) onTimePicked;
  final TimeOfDay? initTime;
  final InputSize inputSize;
  final Function(TimeOfDay?)? onSaved;
  final bool isRequired;
  final TextEditingController? controller;

  @override
  State<CustomTimePickerTextField> createState() =>
      _CustomTimePickerTextFieldState();
}

class _CustomTimePickerTextFieldState extends State<CustomTimePickerTextField> {
  TextEditingController? _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    if (widget.initTime != null) {
      _controller!.text =
          AppDateTimeHelper.convertTimeToString(widget.initTime!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      initialValue:
          widget.initTime != null ? _formatTime(widget.initTime!) : null,
      labelText: widget.label,
      controller: _controller!,
      focusNode: _focusNode,
      readOnly: true,
      onSaved: (text) {
        widget.onSaved?.call(_sTot(text));
      },
      inputSize: widget.inputSize,
      validator: widget.validator,
      onTap: () => _openTimePicker(),
      suffixConstraints: const BoxConstraints(maxWidth: 32, maxHeight: 24),
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: AppIcon.clock2,
      ),
      contentPadding: const EdgeInsets.fromLTRB(14, 8, 16, 8),
    );
  }

  void _openTimePicker() async {
    TimeOfDay? time = await showCustomTimePicker(context);
    if (time != null) {
      _controller!.text = _formatTime(time);
      widget.onTimePicked.call(time);
    }
  }

  TimeOfDay? _sTot(String? text) {
    if (text != null) {
      List<String> splitTimePeriod = text.split(" ");
      List<String> splitTime = splitTimePeriod[0].split(":");
      int hour = int.parse(splitTime[0]);
      int minute = int.parse(splitTime[1]);
      return TimeOfDay(hour: hour, minute: minute);
    }
    return null;
  }

  String _formatTime(TimeOfDay time) {
    return "${time.hour.toString().padLeft(2, "0")}:${time.minute.toString().padLeft(2, "0")} ${time.period.name.toUpperCase()}";
  }
}
