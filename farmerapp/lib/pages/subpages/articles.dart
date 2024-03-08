import 'dart:ffi';

import 'package:farmerapp/pages/subpages/articlepage.dart';
import 'package:flutter/material.dart';

class ArticleItem {
  String imgUrl;
  String articleTitle;
  String articleDescription;
  String author;
  String date;

  ArticleItem(this.imgUrl, this.articleTitle, this.articleDescription,
      this.author, this.date);
}

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  // @override
  // Widget build(BuildContext context) {
  //   return const Center(
  //     child: Text('Articles'),
  //   );
  // }
  List<ArticleItem> listTiles = [
    ArticleItem(
      "https://images.pexels.com/photos/2647053/pexels-photo-2647053.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "MOO MOOO MOTHERFUCKER",
      "Suvan drinks milk everyday due to which his dick has increased to an unreal size, he has the biggest dick in the entire city - in the entire UNIVERSE. His dick is so big he could house the entire world in it.Suvan drinks milk everyday due to which his dick has increased to an unreal size, he has the biggest dick in the entire city - in the entire UNIVERSE. His dick is so big he could house the entire world in it.Suvan drinks milk everyday due to which his dick has increased to an unreal size, he has the biggest dick in the entire city - in the entire UNIVERSE. His dick is so big he could house the entire world in it.Suvan drinks milk everyday due to which his dick has increased to an unreal size, he has the biggest dick in the entire city - in the entire UNIVERSE. His dick is so big he could house the entire world in it.",
      "Suvan the God",
      "20 Jun 2004",
    ),
    ArticleItem(
      "https://images.pexels.com/photos/2647053/pexels-photo-2647053.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "MOO MOOO MOTHERFUCKER",
      "Suvan drinks milk everyday due to which his dick has increased to an unreal size, he has the biggest dick in the entire city - in the entire UNIVERSE. His dick is so big he could house the entire world in it.",
      "Suvan the God",
      "20 Jun 2004",
    ),
    ArticleItem(
      "https://images.pexels.com/photos/2647053/pexels-photo-2647053.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "MOO MOOO MOTHERFUCKER",
      "Suvan drinks milk everyday due to which his dick has increased to an unreal size, he has the biggest dick in the entire city - in the entire UNIVERSE. His dick is so big he could house the entire world in it.",
      "Suvan the God",
      "20 Jun 2004",
    ),
    ArticleItem(
      "https://images.pexels.com/photos/2647053/pexels-photo-2647053.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "MOO MOOO MOTHERFUCKER",
      "Suvan drinks milk everyday due to which his dick has increased to an unreal size, he has the biggest dick in the entire city - in the entire UNIVERSE. His dick is so big he could house the entire world in it.",
      "Suvan the God",
      "20 Jun 2004",
    ),
    ArticleItem(
      "https://images.pexels.com/photos/2647053/pexels-photo-2647053.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "MOO MOOO MOTHERFUCKER",
      "Suvan drinks milk everyday due to which his dick has increased to an unreal size, he has the biggest dick in the entire city - in the entire UNIVERSE. His dick is so big he could house the entire world in it.",
      "Suvan the God",
      "20 Jun 2004",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        child: ListView.builder(
          itemCount: listTiles.length,
          itemBuilder: (context, index) {
            // return listWidget(listTiles[index]);
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
