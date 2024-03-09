import 'package:farmerapp/pages/subpages/articlepage.dart';
import 'package:flutter/material.dart';

/// Represents an item in the articles list.
class ArticleItem {
  String imgUrl;
  String articleTitle;
  String articleDescription;
  String author;
  String date;

  ArticleItem(this.imgUrl, this.articleTitle, this.articleDescription,
      this.author, this.date);
}

/// Represents the articles page.
class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  List<ArticleItem> listTiles = [
    ArticleItem(
      "https://images.pexels.com/photos/2647053/pexels-photo-2647053.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "MAXIMISING MILK PRODUCTION",
      "Increase milk production by optimizing cow comfort, nutrition, and breeding programs. Implementing these strategies can lead to higher yields and better profits for your dairy farm.",
      "Professor Pal",
      "09 March 2024",
    ),
    // ... other ArticleItem instances ...
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        child: ListView.builder(
          itemCount: listTiles.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArticlePage(
                              article: listTiles[index],
                              tag: 'article-$index',
                            )));
              },
              child: listWidget(listTiles[index], index),
            );
          },
        ),
      ),
    );
  }

  /// Builds the widget for an article item in the list.
  Widget listWidget(ArticleItem item, int index) {
    return Hero(
      tag: 'article-$index',
      child: Card(
        semanticContainer: false,
        elevation: 2.0,
        margin: EdgeInsets.only(bottom: 20.0),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 109,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item.imgUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 10),
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
      ),
    );
  }
}
