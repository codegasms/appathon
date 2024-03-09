/// FILEPATH: /home/SahooBishwajeet/College/AppAThon/appathon/farmerapp/lib/pages/subpages/marketplace.dart
///
/// This file contains the implementation of the `MarketplacePage` widget, which is responsible for displaying the marketplace page in the Farmer App.
///
/// The `MarketplacePage` widget is a stateful widget that maintains the current page index and a list of `ArticleItem` objects.
/// It also includes text editing controllers for the product name, product description, and selling price.
///
/// The `MarketplacePage` widget consists of two main sections: the button bar and the content area.
/// The button bar contains two elevated buttons for switching between the "Buy" and "Sell" pages.
/// The content area displays either the "Buy" page or the "Sell" page based on the current page index.
///
/// The "Buy" page displays a list of `ArticleItem` widgets, each representing an article for sale.
/// Tapping on an article item navigates to the `BuyPage` widget, passing the selected article and a tag as arguments.
///
/// The "Sell" page displays a form for selling a product.
/// It includes dropdown buttons for selecting the product name, text form fields for entering the product description and selling price,
/// and an elevated button for submitting the sell request.
///
/// The `MarketplacePage` widget also includes helper methods for building the "Buy" page and the "Sell" page,
/// as well as a helper method for building a `listWidget` for each `ArticleItem`.
import 'package:farmerapp/localization/app_localizations.dart';
import 'package:farmerapp/pages/subpages/articles.dart';
import 'package:farmerapp/pages/subpages/marketplace/buypage.dart';
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
      "https://images.pexels.com/photos/9487554/pexels-photo-9487554.jpeg?auto=compress&cs=tinysrgb&w=400",
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
      "https://images.pexels.com/photos/9487554/pexels-photo-9487554.jpeg?auto=compress&cs=tinysrgb&w=400",
      "Buffalo Fodder",
      "High quality Buffalo Fodder imported from abroad sold by Shankar from XYZ place.",
      "Shankar",
      "\u20B9 200 ",
    ),
    ArticleItem(
      "https://images.pexels.com/photos/2889347/pexels-photo-2889347.jpeg?auto=compress&cs=tinysrgb&w=400",
      "Equipment",
      "High quality Cow and Buffalo Equipment imported from abroad sold by Govind from XYZ place.",
      "Govind",
      "\u20B9 200 ",
    ),
    ArticleItem(
      "https://images.pexels.com/photos/14187132/pexels-photo-14187132.jpeg?auto=compress&cs=tinysrgb&w=400",
      "Bells",
      "High quality Bells imported from abroad sold by Rammu from XYZ place.",
      "Rammu",
      "\u20B9 200 ",
    ),
  ];

  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController sellingPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    productNameController.text = "milk";
  }

  @override
  void dispose() {
    productNameController.dispose();
    productDescriptionController.dispose();
    sellingPriceController.dispose();
    super.dispose();
  }

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
              child: Text(
                AppLocalization.of(context)
                    .getTranslatedValue("buy")
                    .toString(),
              ),
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
              child: Text(
                AppLocalization.of(context)
                    .getTranslatedValue("sell")
                    .toString(),
              ),
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
      child: ListView.builder(
        itemCount: listTiles.length,
        itemBuilder: (context, index) {
          // return listWidget(listTiles[index]);
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BuyPage(
                            article: listTiles[index],
                            tag: 'shop-$index',
                          )));
            },
            child: listWidget(listTiles[index], index),
          );
        },
      ),
    );
  }

  Widget drawSellPage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            Text(
              AppLocalization.of(context)
                  .getTranslatedValue("sell_page")
                  .toString(),
              style: const TextStyle(fontSize: 20),
            ),
            DropdownButtonFormField<String>(
              value: productNameController.text,
              onChanged: (value) {
                setState(() {
                  productNameController.text = value!;
                });
              },
              decoration: InputDecoration(
                labelText: AppLocalization.of(context)
                    .getTranslatedValue("product_n")
                    .toString(),
              ),
              items: [
                DropdownMenuItem(
                  value: "milk",
                  child: Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("milk")
                        .toString(),
                  ),
                ),
                DropdownMenuItem(
                  value: "curd",
                  child: Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("curd")
                        .toString(),
                  ),
                ),
                DropdownMenuItem(
                  value: "paneer",
                  child: Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("paneer")
                        .toString(),
                  ),
                ),
                DropdownMenuItem(
                  value: "butter",
                  child: Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("butter")
                        .toString(),
                  ),
                ),
                DropdownMenuItem(
                  value: "ghee",
                  child: Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("ghee")
                        .toString(),
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: productDescriptionController,
              decoration: InputDecoration(
                labelText: AppLocalization.of(context)
                    .getTranslatedValue("product_d")
                    .toString(),
              ),
            ),
            TextFormField(
              controller: sellingPriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.currency_rupee),
                labelText: AppLocalization.of(context)
                    .getTranslatedValue("product_sp")
                    .toString(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                print('''{
                  item_name: "${productNameController.text}",
                  item_desc: "${productDescriptionController.text}",
                  item_price: ${sellingPriceController.text},
}''');
                productNameController.clear();
                productDescriptionController.clear();
                sellingPriceController.clear();
              },
              child: Text(
                AppLocalization.of(context)
                    .getTranslatedValue("sell")
                    .toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listWidget(ArticleItem item, int index) {
    return Hero(
      tag: 'shop-$index',
      child: Card(
        semanticContainer: false,
        elevation: 2.0,
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
