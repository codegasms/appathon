/// FILEPATH: /home/SahooBishwajeet/College/AppAThon/appathon/farmerapp/lib/pages/subpages/settings/faq/expansion.dart
///
/// This file contains the implementation of the [ExpansionPanelListExample] widget, which displays a list of expansion panels with FAQ items.
/// The FAQ items are fetched using the [AppLocalization] class to get the translated values.
///
/// The [ExpansionPanelListExample] widget is a stateful widget that extends [StatefulWidget].
/// It creates an instance of [_ExpansionPanelListExampleState] as its state.
///
/// The [_ExpansionPanelListExampleState] class is the state class for the [ExpansionPanelListExample] widget.
/// It overrides the [build] method to build the UI for the widget.
/// The UI consists of a [SingleChildScrollView] containing a [Column] of [Card]s.
/// Each [Card] represents an expansion panel and contains a [Column] of [Text] widgets to display the FAQ items.
/// The FAQ items are fetched using the [AppLocalization] class to get the translated values.
import 'package:farmerapp/localization/app_localizations.dart';
import 'package:flutter/material.dart';

import 'faq_item.dart';

class ExpansionPanelListExample extends StatefulWidget {
  const ExpansionPanelListExample({super.key});

  @override
  State<ExpansionPanelListExample> createState() =>
      _ExpansionPanelListExampleState();
}

class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq1")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq1_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq2")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq2_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq3")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq3_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq4")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq4_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq5")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq5_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq6")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq6_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq7")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq7_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq8")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq8_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq9")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq9_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq10")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq10_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq11")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq11_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq12")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq12_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq13")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq13_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq14")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq14_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq15")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq15_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq16")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq16_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq17")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq17_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq18")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq18_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq19")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq19_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq20")
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("faq20_t")
                        .toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
