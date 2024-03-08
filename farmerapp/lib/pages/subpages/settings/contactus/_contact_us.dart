import 'package:farmerapp/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contact_card.dart';

class ContactUsPage extends StatelessWidget {
  final List<ContactCard> developers = [
    ContactCard(
      name: '35UM',
      role: 'Our Team',
      githubUrl: 'https://github.com/codegasms',
      linkedinUrl: '#',
    ),
    ContactCard(
      name: 'Vinayak Anand',
      role: 'Flutter Developer & Backend Developer',
      githubUrl: 'https://github.com/Vinayak-Anand',
      linkedinUrl: 'https://www.linkedin.com/in/vinayak-anand/',
    ),
    ContactCard(
      name: 'Suvan Sarkar',
      role: 'Flutter Developer & Backend Developer',
      githubUrl: 'https://github.com/Suvansarkar',
      linkedinUrl: 'https://www.linkedin.com/in/suvan-sarkar-b1438017a/',
    ),
    ContactCard(
      name: 'Bishwajeet Sahoo',
      role: 'Flutter Developer & UI/UX Designer',
      githubUrl: 'https://github.com/SahooBishwajeet',
      linkedinUrl: 'https://www.linkedin.com/in/bishwajeet-sahoo/',
    ),
  ];

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
              .getTranslatedValue("contact_us")
              .toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: developers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ContactCardWidget(contactCard: developers[index]),
          );
        },
      ),
    );
  }
}

class ContactCardWidget extends StatelessWidget {
  final ContactCard contactCard;

  const ContactCardWidget({Key? key, required this.contactCard})
      : super(key: key);

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/avatar.png',
              height: 120.0,
              width: 120.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contactCard.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    contactCard.role,
                    style: const TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      InkWell(
                        onTap: () =>
                            _launchUrl(Uri.parse(contactCard.githubUrl)),
                        child: const Icon(
                          Ionicons.logo_github,
                          size: 24.0,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      InkWell(
                        onTap: () =>
                            _launchUrl(Uri.parse(contactCard.linkedinUrl)),
                        child: contactCard.linkedinUrl.contains('@')
                            ? const Icon(
                                Ionicons.mail,
                                size: 24.0,
                              )
                            : const Icon(
                                Ionicons.logo_linkedin,
                                size: 24.0,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
