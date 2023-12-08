import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hoivalani/core/utils/assets/app_svg.dart';
import 'package:hoivalani/core/utils/components/text_fields/enum.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {Key? key,
      required this.labelText,
      this.controller,
      this.isPasswordField = false,
      this.onChanged,
      this.textInputAction,
      this.validator,
      this.onFiledSubmitted,
      this.focusNode,
      this.prefixIcon,
      this.prefixConstraints,
      this.floatingLabelBehavior,
      this.textStyle,
      this.labelStyle,
      this.contentPadding,
      this.suffixIcon,
      this.suffixConstraints,
      this.readOnly = false,
      this.onTap,
      this.minLine,
      this.maxLine,
      this.keyboardType,
      this.textAlignVertical,
      this.alignLabelWithHint,
      this.inputSize = InputSize.small,
      this.isRequired = true,
      this.onSaved,
      this.initialValue,
      this.textAlign})
      : super(key: key);

  final String labelText;
  final InputSize inputSize;
  final TextEditingController? controller;
  final bool isPasswordField;
  final Function(String)? onChanged;
  final Function(String)? onFiledSubmitted;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final BoxConstraints? prefixConstraints;
  final BoxConstraints? suffixConstraints;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final EdgeInsets? contentPadding;
  final Widget? suffixIcon;
  final bool readOnly;
  final Function()? onTap;
  final int? minLine;
  final int? maxLine;
  final TextInputType? keyboardType;
  final TextAlignVertical? textAlignVertical;
  final bool? alignLabelWithHint;
  final bool isRequired;
  final String? initialValue;
  final TextAlign? textAlign;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  TextEditingController? _controller;
  FocusNode? _focusNode;
  bool _passwordVisible = false;

  //bool _hasError = false;

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
            widget.onSaved!.call(_controller!.text);
          }
        },
        validator: (value) {
          String? error;
          if (widget.isRequired && (_controller!.text.isEmpty)) {
            error = "Please enter ${widget.labelText}";
          } else if (widget.validator != null) {
            error = widget.validator!.call(_controller!.text);
          }
          // WidgetsBinding.instance.addPostFrameCallback(
          //     (_) => setState(() => _hasError = error != null));
          return error;
        },
        builder: (state) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  autocorrect: false,
                  textAlign: widget.textAlign ?? TextAlign.start,
                  controller: _controller,
                  onFieldSubmitted: widget.onFiledSubmitted,
                  textInputAction: widget.textInputAction,
                  minLines: widget.minLine,
                  maxLines: widget.maxLine ?? 1,
                  textAlignVertical: widget.textAlignVertical,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                  ],
                  keyboardType:
                      widget.keyboardType ?? TextInputType.visiblePassword,
                  onTap: widget.onTap ?? _requestFocus,
                  focusNode: _focusNode,
                  readOnly: widget.readOnly,
                  onChanged: (text) {
                    if (widget.onChanged != null) {
                      widget.onChanged!.call(text);
                    }
                  },
                  style: (widget.textStyle == null)
                      ? Theme.of(context).textTheme.bodyLarge!.apply(
                            decoration: TextDecoration.none,
                          )
                      : widget.textStyle!.apply(
                          decoration: TextDecoration.none,
                        ),
                  obscureText: widget.isPasswordField && !_passwordVisible,
                  decoration: InputDecoration(
                    constraints: BoxConstraints(maxHeight: _getMaxHeight()),
                    labelText: widget.labelText,
                    alignLabelWithHint: widget.alignLabelWithHint,
                    suffixIcon: widget.suffixIcon ?? _getSuffix(),
                    contentPadding:
                        widget.contentPadding ?? _getContentPadding(),
                    floatingLabelBehavior: widget.floatingLabelBehavior,
                    prefixIcon: widget.prefixIcon,
                    prefixIconConstraints: widget.prefixConstraints,
                    suffixIconConstraints: widget.suffixConstraints,
                    labelStyle: (widget.labelStyle == null)
                        ? Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: _getLabelColor(state))
                        : widget.labelStyle!
                            .apply(color: _getLabelColor(state)),
                  ),
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
            ));
  }

  @override
  void dispose() {
    //_controller!.dispose();
    _focusNode?.removeListener(_requestFocus);
    _focusNode?.dispose();
    super.dispose();
  }

  void _requestFocus() {
    _focusNode!.addListener(() {
      setState(() {});
    });
  }

  Widget? _getSuffix() {
    if (widget.isPasswordField) {
      return Padding(
        padding: const EdgeInsets.all(11),
        child: (GestureDetector(
            onTap: () => setState(() {
                  _passwordVisible = !_passwordVisible;
                }),
            child: _passwordVisible
                ? (_focusNode!.hasFocus
                    ? AppIcon.passwordVisible
                    : AppIcon.passwordVisibleUnfocused)
                : (_focusNode!.hasFocus
                    ? AppIcon.passwordInvisible
                    : AppIcon.passwordInvisibleUnfocused))),
      );
    }
    return null;
  }

  Color _getLabelColor(FormFieldState<Object?> fieldState) {
    if (fieldState.hasError) {
      return AppColors.error;
    } else {
      if (_focusNode!.hasFocus) {
        return Theme.of(context).primaryColor;
      } else {
        return Theme.of(context).disabledColor;
      }
    }
  }

  EdgeInsets? _getContentPadding() {
    switch (widget.inputSize) {
      case InputSize.small:
        return const EdgeInsets.symmetric(vertical: 8, horizontal: 14);
      case InputSize.normal:
        return const EdgeInsets.fromLTRB(14, 16, 10, 16);
    }
  }

  double _getMaxHeight() {
    switch (widget.inputSize) {
      case InputSize.small:
        return 40;
      case InputSize.normal:
        return 56;
    }
  }

  void _addListener() {
    _controller!.addListener(() {});
  }

  void _init() {
    _focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? TextEditingController();
    if (widget.initialValue != null) {
      _controller!.text = widget.initialValue!;
    }
    _addListener();
  }
}
