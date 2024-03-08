import 'package:farmerapp/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../contactus/_contact_us.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

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
              .getTranslatedValue("privacy_policy")
              .toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("last_updates")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp1")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp1_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp2")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp2_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp3")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp3_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp4")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp4_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp5")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp5_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp6")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp6_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp7")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp7_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp8")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp8_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp9")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp9_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp10")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp10_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp11")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp11_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp12")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp12_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp13")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp13_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("pp14")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactUsPage()));
                },
                child: Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("pp14_t")
                      .toString(),
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
