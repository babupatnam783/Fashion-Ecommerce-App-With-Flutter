import 'package:flutter/material.dart';

class AppBottomSheet {
  static Future<void> display(BuildContext context, Widget widget) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        )
      ),
      builder: (_) {
        return widget;
      },
    );
  }
}
