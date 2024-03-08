import 'package:farmerapp/pages/subpages/articles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({super.key});

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  int currentPage = 0;

  List<ArticleItem> listTiles = [
    ArticleItem(
      "https://images.pexels.com/photos/2647053/pexels-photo-2647053.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "Cow Fodder",
      "High quality Cow Fodder imported from abroad sold by Raju from XYZ place.",
      "Raju",
      "\u20B9 200",
    ),
    ArticleItem(
      "https://images.pexels.com/photos/2647053/pexels-photo-2647053.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "Haybale",
      "High quality Haybale imported from abroad sold by Ramesh from XYZ place.",
      "Ramesh",
      "\u20B9 200",
    ),
    ArticleItem(
      "https://images.pexels.com/photos/2647053/pexels-photo-2647053.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "Buffalo Fodder",
      "High quality Buffalo Fodder imported from abroad sold by Shankar from XYZ place.",
      "Shankar",
      "\u20B9 200 ",
    ),
    ArticleItem(
      "https://images.pexels.com/photos/2647053/pexels-photo-2647053.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "Equipment",
      "High quality Cow and Buffalo Equipment imported from abroad sold by Govind from XYZ place.",
      "Govind",
      "\u20B9 200 ",
    ),
    ArticleItem(
      "https://images.pexels.com/photos/2647053/pexels-photo-2647053.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "Bells",
      "High quality Bells imported from abroad sold by Rammu from XYZ place.",
      "Rammu",
      "\u20B9 200 ",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentPage = 0;
                });
              },
              style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all(Colors.green),
                minimumSize:
                    MaterialStateProperty.all(Size(context.width * 0.4, 50)),
              ),
              child: const Text('Buy'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentPage = 1;
                });
              },
              style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all(Colors.green),
                minimumSize:
                    MaterialStateProperty.all(Size(context.width * 0.4, 50)),
              ),
              child: const Text('Sell'),
            ),
          ],
        ),
        Expanded(
          // height: 200,
          child: currentPage == 0 ? drawBuyPage() : drawSellPage(),
        ),
      ],
    );
  }

  Widget drawBuyPage() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        child: ListView.builder(
          itemCount: listTiles.length,
          itemBuilder: (context, index) {
            // return listWidget(listTiles[index]);
            return InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ArticlePage(
                //               article: listTiles[index],
                //               tag: 'article-$index',
                //             )));
              },
              child: listWidget(listTiles[index], index),
            );
          },
        ),
      ),
    );
  }

  Widget drawSellPage() {
    return const Center(
      child: Text('Sell'),
    );
  }

  Widget listWidget(ArticleItem item, int index) {
    return Hero(
      tag: 'article-$index',
      child: Card(
        semanticContainer: false,
        elevation: 2.0,
        margin: EdgeInsets.only(bottom: 20.0),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item.imgUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.articleTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item.articleDescription,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.date,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "~${item.author}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
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
      ),
    );
  }
}
