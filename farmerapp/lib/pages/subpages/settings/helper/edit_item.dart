import 'package:flutter/material.dart';

/// A widget that represents an editable item in a settings page.
class EditItem extends StatelessWidget {
  final Widget widget;
  final String title;

  /// Constructs a new [EditItem] with the given [widget] and [title].
  const EditItem({
    Key? key,
    required this.widget,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 5,
          child: widget,
        )
      ],
    );
  }
}
