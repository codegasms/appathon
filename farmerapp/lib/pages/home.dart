import 'package:farmerapp/localization/app_localizations.dart';
import 'package:farmerapp/pages/subpages/analytics.dart';
import 'package:farmerapp/pages/subpages/articles.dart';
import 'package:farmerapp/pages/subpages/AIchat.dart';
import 'package:farmerapp/pages/subpages/profile.dart';
import 'package:farmerapp/pages/subpages/marketplace.dart';
import 'package:flutter/material.dart';

/// The home page of the Farmer App.
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.username}) : super(key: key);

  /// The username of the logged-in user.
  final String username;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  final pages = [
    const AnalyticsPage(),
    const ArticlesPage(),
    const AiChatPage(),
    const MarketplacePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello ${widget.username} 👋",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "Here are your stats~",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalization.of(context)
                .getTranslatedValue("home")
                .toString(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.article),
            label: AppLocalization.of(context)
                .getTranslatedValue("articles")
                .toString(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat),
            label:
                AppLocalization.of(context).getTranslatedValue("ai").toString(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            label: AppLocalization.of(context)
                .getTranslatedValue("market")
                .toString(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: AppLocalization.of(context)
                .getTranslatedValue("user")
                .toString(),
          ),
        ],
      ),
    );
  }
}
