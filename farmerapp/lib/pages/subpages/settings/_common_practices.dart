import 'package:farmerapp/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

/// A widget that displays common practices.
class CommonPractices extends StatelessWidget {
  const CommonPractices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 60,
        title: Text(
          AppLocalization.of(context)
              .getTranslatedValue("common_practices")
              .toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
      body: const Text('Dummy Text'),
    );
  }
}
