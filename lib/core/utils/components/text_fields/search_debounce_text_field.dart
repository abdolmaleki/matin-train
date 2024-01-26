import 'package:flutter/material.dart';
import 'package:team_project/core/utils/components/containers/shadowed_container.dart';
import 'package:team_project/core/utils/components/drop_down/drop_down_item.dart';
import 'package:team_project/core/utils/components/drop_down/enum.dart';
import 'package:team_project/core/utils/components/images/circle_avatar.dart';
import 'package:team_project/core/utils/components/text_fields/debounce_text_field.dart';
import 'package:team_project/core/utils/constants/theme/colors.dart';

class CustomSearchDebounceTextField extends StatefulWidget {
  const CustomSearchDebounceTextField(
      {Key? key,
      required this.label,
      this.dropDownType = DropDownType.text,
      required this.items,
      required this.onSelected,
      this.isRequired = true,
      this.onSaved,
      this.initialValue,
      required this.onChanged,
      required this.controller})
      : super(key: key);

  final String label;
  final DropDownType dropDownType;
  final List<CustomDropDownItem> items;
  final Function(dynamic) onSelected;
  final bool isRequired;
  final Function(CustomDropDownItem?)? onSaved;
  final CustomDropDownItem? initialValue;
  final Function(String) onChanged;
  final TextEditingController? controller;

  @override
  State<CustomSearchDebounceTextField> createState() =>
      _CustomSearchDebounceTextFieldState();
}

class _CustomSearchDebounceTextFieldState
    extends State<CustomSearchDebounceTextField> with TickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  CustomDropDownItem? _selectedItem;
  bool _isOpenedList = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    _openOverlayIfItemsExist();
    ThemeData theme = Theme.of(context);
    return FormField(
      validator: (value) {
        if (widget.isRequired) {
          if (_selectedItem == null) {
            return "Please select ${widget.label}";
          }
        }
        return null;
      },
      onSaved: (value) {
        widget.onSaved?.call(_selectedItem);
      },
      builder: (state) => Column(
        children: [
          CompositedTransformTarget(
            link: _layerLink,
            child: CustomDebounceTextField(
              controller: _controller,
              focusNode: _focusNode,
              onChanged: (text) {
                widget.onChanged.call(text);
              },
              label: 'Search',
              // decoration: InputDecoration(
              //   labelText: widget.label,
              //   constraints: const BoxConstraints(maxHeight: 40),
              //   contentPadding:
              //       const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              //   prefixIconConstraints: _getPrefixConstraint(),
              //   prefixIcon: _buildPrefixIcon(),
              //   labelStyle: Theme.of(context).textTheme.bodyLarge!.apply(
              //       color: _focusNode.hasFocus
              //           ? Theme.of(context).primaryColor
              //           : Theme.of(context).disabledColor),
              // ),
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
                    // open top or bottom of widget based on position
                    offset: _getOffset(
                        widgetHeight: size.height, absoluteDy: absolutPosition),
                    child: CustomShadowedContainer(
                        padding: const EdgeInsets.all(8),
                        radius: 12,
                        child: ListView.builder(
                            itemCount: widget.items.length,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => MenuListItem(
                                  onSelected: (item) {
                                    _selectedItem = item;
                                    widget.onSelected.call(item.value);
                                    _controller.text = item.label;
                                    _focusNode.unfocus();
                                  },
                                  item: widget.items[index],
                                  dropDownType: widget.dropDownType,
                                  itemHeight: _getItemHeight(),
                                ))),
                  ),
                ),
              ],
            )));
  }

  void _closeOverlay() {
    if (_isOpenedList) {
      if (_overlayEntry != null) {
        _overlayEntry!.remove();
        _isOpenedList = false;
      }
    }
  }

  void _openOverlay() {
    if (!_isOpenedList && _focusNode.hasFocus) {
      OverlayState overlayState = Overlay.of(context);
      _overlayEntry = _createOverlay();
      overlayState.insert(_overlayEntry!);
      _isOpenedList = true;
    }
  }

  void _addFocusListener() {
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _closeOverlay();
        //setState(() {});
      }
    });
  }

  @override
  void dispose() {
   // _focusNode=null;
    super.dispose();
  }

  void _init() {
    _addFocusListener();
    if (widget.initialValue != null) {
      _selectedItem = widget.initialValue;
      _controller.text = widget.initialValue!.label;
    }
    _controller = widget.controller ?? TextEditingController();
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

  // Widget? _buildPrefixIcon() {
  //   switch (widget.dropDownType) {
  //     case DropDownType.text:
  //       return null;
  //     case DropDownType.avatar:
  //       return (_selectedItem != null)
  //           ? Padding(
  //               padding: const EdgeInsets.only(left: 15, right: 4),
  //               child: CustomCircleAvatar(
  //                 size: 24,
  //                 imageUrl: _selectedItem!.leading!.toString(),
  //               ),
  //             )
  //           : null;
  //     case DropDownType.badge:
  //       return (_selectedItem != null)
  //           ? Padding(
  //               padding: const EdgeInsets.only(left: 16, right: 4),
  //               child: _selectedItem!.leading as Widget,
  //             )
  //           : null;
  //     case DropDownType.icon:
  //       return null;
  //   }
  // }
  //
  // BoxConstraints? _getPrefixConstraint() {
  //   switch (widget.dropDownType) {
  //     case DropDownType.text:
  //       return null;
  //     case DropDownType.avatar:
  //       return const BoxConstraints(maxHeight: 24, maxWidth: 43);
  //     case DropDownType.badge:
  //       return const BoxConstraints(maxHeight: 8, maxWidth: 28);
  //     case DropDownType.icon:
  //       return null;
  //   }
  // }

  void _openOverlayIfItemsExist() {
    if (widget.items.isNotEmpty) {
      Future.delayed(
        const Duration(milliseconds: 50),
        () {
          _openOverlay();
        },
      );
    }
  }
}

class MenuListItem extends StatelessWidget {
  const MenuListItem(
      {super.key,
      required this.item,
      required this.onSelected,
      required this.dropDownType,
      required this.itemHeight});

  final DropDownType dropDownType;
  final double itemHeight;
  final CustomDropDownItem item;
  final Function(CustomDropDownItem) onSelected;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return (item.children == null)
        ? GestureDetector(
            onTap: () => onSelected.call(item),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              height: itemHeight,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: Row(
                children: [
                  _buildLeading(),
                  Text(
                    item.label,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }

  Widget _buildLeading() {
    switch (dropDownType) {
      case DropDownType.text:
      case DropDownType.icon:
        return const SizedBox();
      case DropDownType.badge:
        return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: item.leading as Widget);
      case DropDownType.avatar:
        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child:
              CustomCircleAvatar(size: 40, imageUrl: item.leading!.toString()),
        );
    }
  }
}
