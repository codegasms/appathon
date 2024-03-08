import 'package:farmerapp/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'expansion.dart';

class FAQPage extends StatelessWidget {
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
          AppLocalization.of(context).getTranslatedValue("faq").toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: ExpansionPanelListExample(),
      ),
    );
  }
}
