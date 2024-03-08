import 'package:flutter/material.dart';

import 'faq_item.dart';

class ExpansionPanelListExample extends StatefulWidget {
  const ExpansionPanelListExample({super.key});

  @override
  State<ExpansionPanelListExample> createState() =>
      _ExpansionPanelListExampleState();
}

class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
  final List<FAQItem> _data = [
    FAQItem(
      question: 'What is BachavSetu?',
      answer:
          'BachavSetu is a disaster management application designed to provide timely information and assistance during various types of disasters. It aims to enhance the safety and preparedness of individuals and communities by offering real-time alerts, guidance, and resources.',
    ),
    FAQItem(
      question: 'How does BachavSetu help during a disaster?',
      answer:
          'BachavSetu provides real-time alerts about impending disasters, offers guidance on how to prepare and respond, and connects users with emergency services and resources. It also includes features for reporting emergencies and sharing location information with rescuers.',
    ),
    FAQItem(
      question: 'Is BachavSetu available on all mobile platforms?',
      answer:
          'BachavSetu is currently available on the Android platform. We are actively developing and enhancing its features to provide users with a seamless experience in addressing their needs.',
    ),
    FAQItem(
      question: 'How can I report an emergency using BachavSetu?',
      answer:
          'Users can report emergencies directly through the application by providing details of the situation and their location. This information is immediately relayed to the relevant emergency services for a quick response.',
    ),
    FAQItem(
      question:
          'Can I use BachavSetu to get information about local shelters and aid centers?',
      answer:
          'Yes, BachavSetu provides information about nearby shelters, aid centers, and other essential services during a disaster. Users can access this information to find immediate assistance and support.',
    ),
    FAQItem(
      question:
          'Is there a feature for family and friends to stay connected during a disaster?',
      answer:
          'Absolutely. BachavSetu recognizes the importance of staying connected with family and friends during challenging times. Our application will include a dedicated feature to facilitate communication and coordination among users during disasters.\n\nThe "Family Connect" feature allows you to:\n  1. Create Groups: Form groups with family members and friends to enable quick and efficient communication.\n  2. Share Updates: Share real-time updates on your safety and well-being with your designated groups.\n  3. Check-in Functionality: Use the check-in feature to notify your loved ones about your current status and location during a disaster.\n  4. Emergency Contact Information: Store and easily access emergency contact information for quick reference.\n\nThis feature is designed to provide a sense of reassurance and support, ensuring that you and your loved ones can stay informed and connected during challenging situations. For more details or assistance with utilizing the "Family Connect" feature, refer to the app\'s user guide or contact our support team. Thank you for choosing BachavSetu as your trusted companion in times of need.',
    ),
    FAQItem(
      question:
          'How does BachavSetu ensure the accuracy of its disaster alerts and information?',
      answer:
          'BachavSetu sources its information from reliable and official sources, ensuring that the alerts and guidance provided are accurate and up-to-date. The application is regularly updated to maintain the quality of information.',
    ),
    FAQItem(
      question:
          'Is there a way to customize the type of disaster alerts I receive?',
      answer:
          'Certainly! BachavSetu is designed to offer a personalized experience, including customization of disaster alerts. Users can easily customize the types of alerts they receive based on their preferences and geographical location. In the app settings, you will find options to select specific disaster categories or types of incidents for which you want to receive alerts.\n\nTo tailor your alert preferences:\n1. Open BachavSetu on your device.\n2. Navigate to the Settings section.\n3. Look for the "Alert Preferences" or a similar option.\n4. Choose the specific disaster categories or types of alerts you wish to receive.\n\nBy providing this flexibility, BachavSetu aims to empower users to stay informed about the events that matter most to them. If you have further questions or need assistance with customization, feel free to contact our support team. We appreciate your commitment to preparedness and safety with BachavSetu.',
    ),
    FAQItem(
      question:
          'What should I do if I encounter technical issues with BachavSetu?',
      answer:
          'For any technical issues, users can contact our support team through dotconfig@proton.me. We are committed to resolving issues promptly to ensure the app\'s effectiveness during critical times.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((FAQItem item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.question),
            );
          },
          body: ListTile(
            title: Text(item.answer),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
