import 'package:flutter/material.dart';

/// A widget that represents an editable item with a single child widget.
class EditItem2 extends StatelessWidget {
  final Widget widget;

  /// Constructs a new [EditItem2] instance.
  ///
  /// The [widget] parameter is required and represents the child widget to be displayed.
  const EditItem2({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: widget,
        )
      ],
    );
  }
}
