import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

/// A custom forward button widget.
///
/// This widget displays a forward button with a chevron icon.
/// It can be used to navigate to the next screen or perform any other action
/// when tapped.
class ForwardButton extends StatelessWidget {
  final Function() onTap;

  /// Creates a [ForwardButton] widget.
  ///
  /// The [onTap] parameter is a callback function that will be called when
  /// the button is tapped.
  const ForwardButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(Ionicons.chevron_forward_outline),
      ),
    );
  }
}
