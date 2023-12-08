import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/assets/app_svg.dart';
import 'package:hoivalani/core/utils/components/color/solid_filter.dart';
import 'package:hoivalani/core/utils/components/containers/shadowed_container.dart';
import 'package:hoivalani/core/utils/components/drop_down/drop_down_item.dart';
import 'package:hoivalani/core/utils/components/drop_down/enum.dart';
import 'package:hoivalani/core/utils/components/drop_down/multi_select_drop_down/menu_list_item.dart';
import 'package:hoivalani/core/utils/components/drop_down/multi_select_drop_down/tag.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';

class CustomMultiSelectDropDown extends StatefulWidget {
  const CustomMultiSelectDropDown(
      {Key? key,
      required this.label,
      required this.dropDownType,
      required this.items,
      required this.onSelected,
      this.selectedItems,
      this.isRequired = true,
      this.onSaved})
      : super(key: key);

  final String label;
  final DropDownType dropDownType;
  final List<CustomDropDownItem> items;
  final Function(dynamic) onSelected;
  final bool isRequired;
  final Function(Set<CustomDropDownItem>?)? onSaved;
  final Set<CustomDropDownItem>? selectedItems;

  @override
  State<CustomMultiSelectDropDown> createState() =>
      _CustomMultiSelectDropDownState();
}

class _CustomMultiSelectDropDownState extends State<CustomMultiSelectDropDown>
    with TickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final TextEditingController _textController = TextEditingController();
  late Set<CustomDropDownItem> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.selectedItems ?? {};
    _addFocusListener();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return FormField(
      validator: (value) {
        if (widget.isRequired) {
          if (_selectedItems.isEmpty) {
            return "Please select ${widget.label}";
          }
        }
        return null;
      },
      onSaved: (value) {
        widget.onSaved?.call(_selectedItems);
      },
      builder: (state) => Column(
        children: [
          CompositedTransformTarget(
            link: _layerLink,
            child: TextFormField(
              autocorrect: false,
              readOnly: true,
              showCursor: false,
              keyboardType: TextInputType.visiblePassword,
              controller: _textController,
              validator: (String? text) {
                return null;
              },
              focusNode: _focusNode,
              onChanged: (text) {
                //_onChangedText(text);
              },
              style: Theme.of(context).textTheme.bodyLarge!.apply(
                    decoration: TextDecoration.none,
                  ),
              decoration: InputDecoration(
                labelText: widget.label,
                floatingLabelBehavior: _selectedItems.isNotEmpty
                    ? FloatingLabelBehavior.always
                    : FloatingLabelBehavior.auto,
                constraints: const BoxConstraints(maxHeight: 40),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: CustomSolidFilterColor(
                    color: theme.secondaryHeaderColor,
                    child: _focusNode.hasFocus
                        ? AppIcon.arrowTop
                        : AppIcon.chevronDown,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                    maxHeight: 24),
                prefixIcon: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: _selectedItems
                          .toList()
                          .asMap()
                          .map((i, element) => MapEntry(
                              i,
                              CustomDropDownTag(
                                item: _selectedItems.elementAt(i),
                                onRemoved: (item) {
                                  setState(() {
                                    _selectedItems.remove(item);
                                    widget.onSelected
                                        .call(_selectedItems);
                                  });
                                },
                              )))
                          .values
                          .toList(),
                    ),
                  ),
                ),
                suffixIconConstraints: const BoxConstraints(maxWidth: 34),
                labelStyle: Theme.of(context).textTheme.bodyLarge!.apply(
                    color: _focusNode.hasFocus
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor),
              ),
            ),
          ),
          if (state.hasError)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(state.errorText!,
                    style: theme.textTheme.bodySmall!
                        .apply(color: AppColors.error)),
              ),
            ),
        ],
      ),
    );
  }

  OverlayEntry _createOverlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final absolutPosition = renderBox.localToGlobal(Offset.zero).dy;

    var size = renderBox.size;
    return OverlayEntry(
        builder: (context) => SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GestureDetector(
                    onTap: () => _focusNode.unfocus(),
                  ),
                ),
                Positioned(
                  width: size.width,
                  child: CompositedTransformFollower(
                    link: _layerLink,
                    showWhenUnlinked: false,
                    offset: _getOffset(
                        widgetHeight: size.height, absoluteDy: absolutPosition),
                    child: CustomShadowedContainer(
                        padding: const EdgeInsets.all(8),
                        radius: 12,
                        child: ListView.builder(
                            itemCount: widget.items.length,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => CustomMenuListItem(
                                  onSelected: (item) {
                                    setState(() {
                                      _selectedItems.add(item);
                                      widget.onSelected
                                          .call(_selectedItems);
                                    });
                                  },
                                  item: widget.items[index], dropDownType: widget.dropDownType,
                              itemHeight: _getItemHeight(),
                                ))),
                  ),
                ),
              ],
            )));
  }

  void _closeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
    }
  }

  void _addFocusListener() {
    OverlayState? overlayState = Overlay.of(context);

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlay();
        overlayState.insert(_overlayEntry!);
      } else {
        _closeOverlay();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  double _getItemHeight() {
    switch (widget.dropDownType) {
      case DropDownType.text:
        return 30;
      case DropDownType.badge:
        return 34;
      case DropDownType.avatar:
        return 52;
      case DropDownType.icon:
        return 40;
    }
  }

  Offset _getOffset(
      {required double widgetHeight, required double absoluteDy}) {
    final screenHeight = MediaQuery.of(context).size.height;
    bool showBottomOfWidget = absoluteDy < screenHeight / 2;
    final double menuHeight = ((widget.items.length) * _getItemHeight()) + 40;

    return showBottomOfWidget
        ? Offset(0.0, widgetHeight + 5.0)
        : Offset(0.0, -menuHeight + 5.0);
  }
}
