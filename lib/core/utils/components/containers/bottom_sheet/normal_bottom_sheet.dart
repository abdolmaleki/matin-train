import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/constants/keys/global_keys.dart';

Future<T?> showCustomBottomSheet<T>(
    {BuildContext? context,
    required Widget child,
    bool isScrollControlled = false}) {
  return showModalBottomSheet(
      context: context ?? masterLayoutScaffoldKey.currentContext!,
      isScrollControlled: isScrollControlled,
      builder: (builder) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(masterLayoutScaffoldKey.currentContext!).viewInsets.bottom),
        child: Container(
              color: Colors.transparent, //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0))),
                  child: child),
            ),
      ));
}
