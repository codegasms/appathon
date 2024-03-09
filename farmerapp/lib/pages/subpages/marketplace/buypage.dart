import 'package:farmerapp/localization/app_localizations.dart';
import 'package:farmerapp/pages/subpages/articles.dart';
import 'package:flutter/material.dart';

class BuyPage extends StatefulWidget {
  final ArticleItem article;
  final String tag;
  const BuyPage({super.key, required this.article, required this.tag});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  int production = 0;
  int consumption = 0;
  int sp = 0;
  int cp = 0;

  void increment(int value, int which) {
    setState(() {
      switch (which) {
        case 0:
          production += value;
          break;
        case 1:
          consumption += value;
          break;
        case 2:
          sp += value;
          break;
        case 3:
          cp += value;
          break;
      }
    });
  }

  void decrement(int value, int which) {
    setState(() {
      switch (which) {
        case 0:
          production = (production - value >= 0) ? production - value : 0;
          break;
        case 1:
          consumption = (consumption - value >= 0) ? consumption - value : 0;
          break;
        case 2:
          sp = (sp - value >= 0) ? sp - value : 0;
          break;
        case 3:
          cp = (cp - value >= 0) ? cp - value : 0;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: widget.tag,
                  child: Image.network(widget.article.imgUrl),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Text(
                        widget.article.articleTitle,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Icon(Icons.person),
                              Text(
                                widget.article.author,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(Icons.currency_rupee),
                              Text(
                                widget.article.date,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.article.articleDescription,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => decrement(1, 0),
                          ),
                          Text(
                            "$production",
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            AppLocalization.of(context)
                                .getTranslatedValue("quantity")
                                .toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => increment(1, 0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalization.of(context)
                              .getTranslatedValue("buy")
                              .toString(),
                        ),
                        // style: ButtonStyle(
                        //     // backgroundColor:
                        //     // MaterialStateProperty.all(Colors.green),
                        //     ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
