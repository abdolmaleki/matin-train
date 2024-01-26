import 'package:flutter/material.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class CustomTextArea extends StatefulWidget {
  const CustomTextArea(
      {super.key,
      required this.label,
      this.controller,
      this.onChanged,
      this.onSaved,
      this.isRequired = true,
      this.initialValue,
      this.validator});

  final String label;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool isRequired;
  final String? initialValue;

  @override
  State<CustomTextArea> createState() => _CustomTextAreaState();
}

class _CustomTextAreaState extends State<CustomTextArea> {
  String? _enteredText;
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      onSaved: (value) {
        if (widget.onSaved != null) {
          widget.onSaved!.call(_enteredText);
        }
      },
      validator: (value) {
        String? error;
        if (widget.isRequired &&
            (_enteredText == null || _enteredText!.isEmpty)) {
          error = "Please enter ${widget.label}";
        } else if (widget.validator != null) {
          error = widget.validator!.call(_enteredText);
        }
        return error;
      },
      builder: (state) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _controller,
            textAlignVertical: TextAlignVertical.top,
            onChanged: (text) {
              _enteredText = text;
              widget.onChanged?.call(text);
            },
            decoration: InputDecoration(
              labelText: widget.label,
              alignLabelWithHint: true,
              labelStyle: Theme.of(context).textTheme.bodyLarge!.apply(color:  Theme.of(context).disabledColor)
            ),
            maxLines: 6,
            minLines: 5,
          ),
          if (state.hasError)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(state.errorText!,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(color: AppColors.error)),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _addListener() {
    _controller?.addListener(() {
      _enteredText = _controller!.text;
    });
  }

  void _init() {
    _controller = widget.controller ?? TextEditingController();
    if (widget.initialValue != null) {
      _controller!.text = widget.initialValue!;
      _enteredText = widget.initialValue!;
    }
    _addListener();
  }
}
