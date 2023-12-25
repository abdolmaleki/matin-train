import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:team_project/core/utils/components/text_fields/enum.dart';
import 'package:team_project/core/utils/components/text_fields/normal_text_field.dart';


class CustomColorPickerTextField extends StatefulWidget {
    CustomColorPickerTextField(
      {super.key,
        this.onChanged,
        required this.label,
        required this.currentColor,
        this.suffixIcon,
        this.validator,
        this.inputSize = InputSize.small,
        this.isRequired = true, this.controller});

  final String label;
  Color currentColor;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final InputSize inputSize;
  final bool isRequired;
  final TextEditingController? controller;
    final Function(String)? onChanged;

  @override
  State<CustomColorPickerTextField> createState() =>
      _CustomDatePickerTextFieldState();
}

class _CustomDatePickerTextFieldState extends State<CustomColorPickerTextField> {
  final FocusNode _focusNode = FocusNode();
  Color _currentColor =  HexColor("#2196f3");
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: widget.label,
      controller: widget.controller,
      focusNode: _focusNode,
      readOnly: true,
      onSaved: (value){},
      inputSize: widget.inputSize,
      validator: widget.validator,
      suffixIcon: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color:_currentColor,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
      onTap: () => colorPickerDialog(),
      suffixConstraints: const BoxConstraints(maxWidth: 32, maxHeight: 24),
      contentPadding: const EdgeInsets.fromLTRB(14, 8, 16, 8),
    );
  }


  Future colorPickerDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        content: SingleChildScrollView(
          child: ColorPicker(

            pickerColor: _currentColor,
            onColorChanged: (value)async{
              setState(() {
                _currentColor = value;

              });
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                padding: const EdgeInsets.only(
                    left: 30.0, top: 0.0, right: 30.0, bottom: 0.0)),
            onPressed: () {
              Navigator.of(context).pop(false);
                widget.controller?.text =_currentColor.toString();
            },
            child: const Text('CLOSE', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }




}
