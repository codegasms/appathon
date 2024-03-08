import 'package:flutter/material.dart';

class EditItem2 extends StatelessWidget {
  final Widget widget;
  const EditItem2({
    super.key,
    required this.widget,
  });

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
