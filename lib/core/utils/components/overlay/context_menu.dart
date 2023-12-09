import 'package:flutter/material.dart';
import 'package:team_project/core/utils/components/containers/shadowed_container.dart';
import 'package:team_project/core/utils/components/drop_down/drop_down_item.dart';
import 'package:team_project/core/utils/components/drop_down/enum.dart';
import 'package:team_project/core/utils/components/images/circle_avatar.dart';

class CustomContextMenu extends StatefulWidget {
  const CustomContextMenu(
      {Key? key,
      required this.items,
      required this.onSelected,
      required this.button})
      : super(key: key);

  final List<String> items;
  final Function(dynamic) onSelected;
  final Widget button;

  @override
  State<CustomContextMenu> createState() => _CustomContextMenuState();
}

class _CustomContextMenuState extends State<CustomContextMenu>
    with TickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  OverlayState? _overlayState;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
          onTap: () {
            if (_isOpen) {
              _closeOverlay();
            } else {
              _openOverlay();
            }
          },
          child: widget.button),
    );
  }

  OverlayEntry _createOverlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final absolutPositionDy = renderBox.localToGlobal(Offset.zero).dy;
    final absolutPositionDx = renderBox.localToGlobal(Offset.zero).dx;

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
                    onTap: () {
                      if (_isOpen) {
                        _closeOverlay();
                      }
                    },
                  ),
                ),
                Positioned(
                  //width: 200,
                  child: CompositedTransformFollower(
                    link: _layerLink,
                    showWhenUnlinked: false,
                    // open top or bottom of widget based on position
                    offset: _getOffset(
                        widgetHeight: size.height,
                        absoluteDy: absolutPositionDy,
                        absoluteDx: absolutPositionDx,
                        widgetWidth: size.width),
                    child: CustomShadowedContainer(
                        padding: const EdgeInsets.all(8),
                        radius: 12,
                        child: ListView.builder(
                            itemCount: widget.items.length,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Text("Menu $index"))),
                  ),
                ),
              ],
            )));
  }

  void _closeOverlay() {
    _isOpen = false;
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
    }
    setState(() {});
  }

  void _openOverlay() {
    _isOpen = true;
    _overlayEntry = _createOverlay();
    _overlayState!.insert(_overlayEntry!);
    setState(() {});
  }

  @override
  void dispose() {
    _overlayEntry!.dispose();
    super.dispose();
  }

  void _init() {
    _overlayState = Overlay.of(context);
  }

  Offset _getOffset(
      {required double widgetHeight,
      required double widgetWidth,
      required double absoluteDy,
      required double absoluteDx}) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    bool showBottomOfWidget = absoluteDy < screenHeight / 2;
    bool showLeftOfWidget = absoluteDx < screenWidth / 2;
    final double menuHeight = ((widget.items.length) * _getItemHeight()) + 40;
    final offDx = showLeftOfWidget ? widgetWidth + 5 : -widgetWidth - 5;
    final offDy = showBottomOfWidget ? widgetHeight + 5.0 : -menuHeight + 5.0;
    return Offset(offDx, offDy);
  }

  double _getItemHeight() {
    return 30;
    // switch (widget.dropDownType) {
    //   case DropDownType.text:
    //     return 30;
    //   case DropDownType.badge:
    //     return 34;
    //   case DropDownType.avatar:
    //     return 52;
    //   case DropDownType.icon:
    //     return 40;
    // }
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
