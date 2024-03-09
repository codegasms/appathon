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
  List<ArticleItem> listTiles = [
    ArticleItem(
      "https://images.pexels.com/photos/2647053/pexels-photo-2647053.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "MAXIMISING MILK PRODUCTION",
      "Increase milk production by optimizing cow comfort, nutrition, and breeding programs. Implementing these strategies can lead to higher yields and better profits for your dairy farm.",
      "Professor Pal",
      "09 March 2024",
    ),
    ArticleItem(
      "https://images.pexels.com/photos/254178/pexels-photo-254178.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "PASTURE MANAGEMENT TIPS",
      "Improve grazing conditions and forage quality through rotational grazing and effective pasture management. Healthy pastures can lead to healthier cows and higher milk production.",
      "Professor Gopal",
      "05 March 2024",
    ),
    ArticleItem(
      "https://images.pexels.com/photos/7671871/pexels-photo-7671871.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "ENSURING HERD HEALTH",
      "Maintain a healthy dairy herd by following vaccination schedules, implementing disease prevention measures, and providing regular veterinary care. Healthy cows are more productive and lead to a more profitable farm.",
      "Professor Suvan",
      "01 March 2024",
    ),
    ArticleItem(
      "https://images.pexels.com/photos/4910812/pexels-photo-4910812.jpeg",
      "OPTIMIZING FEED EFFICIENCY",
      "Maximize feed efficiency by ensuring your cows receive the right nutrition for their needs. Proper feed management can reduce costs and improve overall herd health and milk production.",
      "Dr. Swaminathan",
      "27 February 2024",
    ),
    ArticleItem(
      "https://images.pexels.com/photos/2383286/pexels-photo-2383286.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "IMPROVING MILK QUALITY",
      "Enhance milk quality by following proper milking procedures, maintaining strict sanitation practices, and adhering to milk storage guidelines. High-quality milk can lead to better market opportunities and increased profits.",
      "Dr. Geetanjali",
      "25 February 2024",
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
