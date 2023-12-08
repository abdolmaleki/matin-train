import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/assets/app_svg.dart';
import 'package:hoivalani/core/utils/components/text_fields/normal_text_field.dart';

class CustomDebounceTextField extends StatefulWidget {
  const CustomDebounceTextField({
    super.key,
    required this.label,
    required this.onChanged,
    required this.controller,
    this.focusNode,
  });

  final Function(String) onChanged;
  final String label;
  final TextEditingController controller;
  final FocusNode? focusNode;

  @override
  State<CustomDebounceTextField> createState() =>
      _CustomDebounceTextFieldState();
}

class _CustomDebounceTextFieldState extends State<CustomDebounceTextField> {
  Timer? _timeHandle;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: widget.label,
      focusNode: widget.focusNode,
      controller: widget.controller,
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 14,right: 8),
        child: AppIcon.search,
      ),
      prefixConstraints:const BoxConstraints(maxHeight: 24,maxWidth: 46) ,
      onChanged: _textChanged,
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_timeHandle != null) {
      _timeHandle!.cancel();
      _timeHandle = null;
    }
  }

  void _textChanged(String val) {
    // If textField is empty immediately call onChange
    if (val.isEmpty) {
      widget.onChanged.call(val);
    } else {
      if (_timeHandle != null) {
        _timeHandle!.cancel();
      }
      _timeHandle = Timer(const Duration(milliseconds: 1500), () {
        if (widget.controller.text.length >= 3) {
          widget.onChanged.call(widget.controller.text);
        }
      });
    }
  }
}
