import 'package:flutter/material.dart';
import 'package:team_project/core/utils/assets/app_svg.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class LanguageDropdownWidget extends StatefulWidget {
  const LanguageDropdownWidget({
    Key? key,
    required this.onLanguageSelected,
    required this.controller,
  }) : super(key: key);

  final Function(Locale?) onLanguageSelected;
  final TextEditingController controller;

  @override
  State<LanguageDropdownWidget> createState() => _LanguageDropdownWidgetState();
}

class _LanguageDropdownWidgetState extends State<LanguageDropdownWidget> {
  final List<LanguageHolder> _totalLanguages = [
    LanguageHolder(
      title: "English - United States",
      flag: SizedBox(
        width: 16,
        height: 10,
        child: AppIcon.usaFlag,
      ),
    ),
    LanguageHolder(
      title: "Finnish",
      flag: SizedBox(
        width: 16,
        height: 10,
        child: AppIcon.finlandFlag,
      ),
    ),
    LanguageHolder(
      title: "Sweden",
      flag: SizedBox(
        width: 16,
        height: 10,
        child: AppIcon.swedenFlag,
      ),
    ),
  ];

  final List<LanguageHolder> _filteredLanguages = [];

  final FocusNode _focusNode = FocusNode();
  bool _isReadOnly = true;

  @override
  void initState() {
    super.initState();
    _filteredLanguages.addAll(_totalLanguages);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          autocorrect: false,
          readOnly: _isReadOnly,
          showCursor: true,
          keyboardType: TextInputType.visiblePassword,
          onTap: () {
            _requestFocus();
          },
          controller: widget.controller,
          validator: (text) {
            if (_totalLanguages.any((element) => element.title == text)) {
              return null;
            } else {
              return "Please select language";
            }
          },
          focusNode: _focusNode,
          onChanged: (text) {
            _onChangedText(text);
          },
          style: Theme.of(context).textTheme.bodyLarge!.apply(
                decoration: TextDecoration.none,
              ),
          decoration: InputDecoration(
            labelText: (!_focusNode.hasFocus && _isValidLanguageSelected())
                ? null
                : "selectLanguage",
            contentPadding: const EdgeInsets.fromLTRB(14, 9, 14, 7),
            filled: true,
            fillColor: AppColors.gray200,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: _isValidLanguageSelected()
                        ? AppColors.gray500.withOpacity(0.32)
                        : Colors.transparent),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            suffixIcon: _focusNode.hasFocus
                ? const Icon(Icons.arrow_drop_up)
                : const Icon(Icons.arrow_drop_down),
            labelStyle: Theme.of(context).textTheme.bodyLarge!.apply(
                color: _focusNode.hasFocus
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        (_focusNode.hasFocus && _filteredLanguages.isNotEmpty)
            ? Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.gray500.withOpacity(0.12),
                          spreadRadius: -4,
                          blurRadius: 24,
                          offset: const Offset(0, 12)),
                      BoxShadow(
                          color: AppColors.gray500.withOpacity(0.20),
                          spreadRadius: 0,
                          blurRadius: 2,
                          offset: const Offset(0, 0))
                    ]),
                child: ListView.builder(
                    itemCount: _filteredLanguages.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _onLanguageSelected(
                              _filteredLanguages[index].title, index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              _filteredLanguages[index].flag,
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  _filteredLanguages[index].title,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            : const SizedBox()
      ],
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _requestFocus() {
    // Keyboard must open in second tap
    setState(() {
      if (_focusNode.hasFocus) {
        if(_isReadOnly){
          _isReadOnly = false;
        }else{
          _focusNode.unfocus();
          _isReadOnly = true;
        }
      } else {
        _isReadOnly = true;
      }
    });
    // Change icon and colors by focus and unfocus
    _focusNode.addListener(() {
      setState(() {
        if (!_focusNode.hasFocus && !_isValidLanguageSelected()) {
          widget.controller.clear();
          _filteredLanguages.clear();
          _filteredLanguages.addAll(_totalLanguages);
          widget.onLanguageSelected.call(null);
        }
      });
    });
  }

  void _onLanguageSelected(String title, int index) {
    _focusNode.unfocus();
    widget.controller.text = title;
    widget.onLanguageSelected.call(_getLocaleByTitle(index));
  }

  bool _isValidLanguageSelected() {
    return widget.controller.text.isNotEmpty &&
        _totalLanguages.any((element) => element.title == widget.controller.text);
  }

  void _onChangedText(String text) {
    setState(() {
      _filteredLanguages.clear();
      if (text.isEmpty) {
        _filteredLanguages.addAll(_totalLanguages);
      } else {
        _filteredLanguages.addAll(_totalLanguages.where((element) =>
            element.title.toLowerCase().startsWith(text.toLowerCase())));
      }
    });
  }

  Locale _getLocaleByTitle(int index) {
    switch (index) {
      case 1:
        return const Locale("fi");
      case 2:
        return const Locale("sv");
      default:
        return const Locale("en");
    }
  }
}

class LanguageHolder {
  String title;
  Widget flag;

  LanguageHolder({required this.title, required this.flag});
}
