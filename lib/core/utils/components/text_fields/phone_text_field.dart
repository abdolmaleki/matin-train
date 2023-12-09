import 'package:flutter/material.dart';
import 'package:team_project/core/utils/assets/counteries.dart';
import 'package:team_project/core/utils/components/text_fields/enum.dart';
import 'package:team_project/core/utils/components/text_fields/normal_text_field.dart';
import 'package:team_project/core/utils/validators/validator_functions.dart';

class CustomPhoneTextField extends StatefulWidget {
  const CustomPhoneTextField(
      {super.key,
      this.controller,
      required this.label,
      this.inputSize = InputSize.normal,
      this.onSaved,
      this.isRequired = true,
      this.initialValue});

  final TextEditingController? controller;
  final String label;
  final InputSize inputSize;
  final Function(String?)? onSaved;
  final bool isRequired;
  final String? initialValue;

  @override
  State<CustomPhoneTextField> createState() => _CustomPhoneTextFieldState();
}

class _CustomPhoneTextFieldState extends State<CustomPhoneTextField> {
  String? countryAbbr;

  @override
  void initState() {
    super.initState();
    _addListener();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: widget.label,
      initialValue: widget.initialValue,
      onSaved: widget.onSaved,
      isRequired: widget.isRequired,
      controller: widget.controller,
      inputSize: widget.inputSize,
      keyboardType: TextInputType.phone,
      validator: AppValidatorFunctions.phoneValidator,
      prefixConstraints: const BoxConstraints(maxWidth: 51, maxHeight: 24),
      prefixIcon: (countryAbbr != null)
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Image.network(
                _getFlagAddress(),
              ),
            )
          : null,
      onChanged: (text) {
        _checkCountryCode(text);
      },
    );
  }

  void _addListener() {}

  void _checkCountryCode(String text) {
    setState(() {
      if (text.isEmpty || text.length < 2) {
        countryAbbr = null;
      } else {
        final countryMap = countries.firstWhere((country) {
          return text.contains(country["dial_code"]!);
        }, orElse: () => {});
        if (countryMap.isNotEmpty) {
          countryAbbr = countryMap["code"];
        } else {
          countryAbbr = null;
        }
      }
    });
  }

  String _getFlagAddress() {
    return "https://flagcdn.com/w40/${countryAbbr!.toLowerCase()}.png";
  }
}
