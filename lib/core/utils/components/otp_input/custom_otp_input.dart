import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';
import 'package:pinput/pinput.dart';

class CustomOtpInput extends StatefulWidget {
  const CustomOtpInput(
      {super.key,
      this.validator,
      required this.length,
      this.onComplete,
      this.onChanged, this.controller});

  final String? Function(String?)? validator;
  final int length;
  final Function(String)? onComplete;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  State<CustomOtpInput> createState() => _CustomOtpInputState();
}

class _CustomOtpInputState extends State<CustomOtpInput> {
  @override
  Widget build(BuildContext context) {
    return Pinput(
      validator: widget.validator,
      closeKeyboardWhenCompleted: true,
      pinputAutovalidateMode:PinputAutovalidateMode.disabled,
      showCursor: true,
      length: widget.length,
      onChanged: widget.onChanged,
      errorTextStyle:
          Theme.of(context).textTheme.bodySmall!.apply(color: AppColors.error),
      errorPinTheme: _getErrorTheme(),
      defaultPinTheme: _getDefaultTheme(),
      onCompleted: widget.onComplete,
      controller: widget.controller,
    );
  }

  PinTheme _getDefaultTheme() {
    return PinTheme(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      textStyle: Theme.of(context).textTheme.bodyLarge,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray500.withOpacity(0.32)),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  PinTheme _getErrorTheme() {
    return PinTheme(
      width: 40,
      height: 40,
      margin: const EdgeInsets.fromLTRB(3, 0, 3, 4),
      textStyle:
          Theme.of(context).textTheme.bodyLarge!.apply(color: AppColors.error),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.error),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
