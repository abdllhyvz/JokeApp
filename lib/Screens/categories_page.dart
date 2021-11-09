import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joke_app/Controllers/category_controller.dart';
import 'package:joke_app/Models/category.dart';
import 'package:joke_app/Requests/requests.dart';

import 'joke_page.dart';

class CategoriesPage extends StatefulWidget {
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final CategoryController categoryController = Get.put(CategoryController());
  final storage = GetStorage();

  getBody() {
    return Obx(() {
      if (categoryController.isLoading.value) {
        return Center(child: CircularProgressIndicator().reactive());
      }
      return ListView.builder(
          itemCount: categoryController.cats.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                child: Card(
                  color: Colors.grey[400],
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: ListTile(
                    onTap: () {
                      storage.write(
                          "chosenCategory", categoryController.cats[index]);
                      Get.to(JokePage());
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    leading: Image.network(
                        "https://assets.chucknorris.host/img/avatar/chuck-norris.png"),
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: Center(
                            child: Text(
                              categoryController.cats[index].toUpperCase(),
                              style: TextStyle(
                                  fontSize: 14.2, fontWeight: FontWeight.bold),
                            ),
                          )),
                        ]),
                  ),
                ));
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "CATEGORIES",
            style: TextStyle(),
          ),
          backgroundColor: Colors.orange[400],
        ),
        body: Container(
            child: Stack(children: [
          Opacity(
            opacity: 0.7,
            child: Image(
              image: AssetImage("assets/joker.jpg"),
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fitHeight,
            ),
          ),
          getBody()
        ])));
  }
}
