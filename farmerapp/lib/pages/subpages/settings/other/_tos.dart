import 'package:farmerapp/localization/app_localizations.dart';
import 'package:farmerapp/pages/subpages/settings/contactus/_contact_us.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

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
              .getTranslatedValue("terms_and_conditions")
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
                    .getTranslatedValue("tnc1")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc1_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc2")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc2_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc3")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc3_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc4")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc4_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc5")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc5_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc6")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc6_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc7")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc7_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc8")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc8_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc9")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc9_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc10")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc10_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc11")
                    .toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc11_t")
                    .toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("tnc12")
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
                      .getTranslatedValue("tnc12_t")
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

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
