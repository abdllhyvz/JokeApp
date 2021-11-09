import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joke_app/Requests/requests.dart';
import 'package:joke_app/Screens/categories_page.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  categoriesButton(BuildContext context) {
    return Container(
        width: 250,
        height: 60,
        child: Opacity(
            opacity: 0.88,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  shadowColor: Colors.orange),
              clipBehavior: Clip.antiAlias,
              onPressed: () {
                Get.to(CategoriesPage());
              },
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.orange, Colors.orange[200]])),
                child: Container(
                  constraints: BoxConstraints(maxHeight: 300, minWidth: 50),
                  alignment: Alignment.center,
                  child: Text(
                    "SEE CATEGORIES",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Container(
            child: Stack(alignment: Alignment.center, children: [
          Opacity(
            opacity: 0.85,
            child: Image(
              image: AssetImage("assets/joker.jpg"),
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * .5),
            child: Text(
              "RANDOM JOKES",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * .1,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Colors.orange[700],
                  shadows: [
                    Shadow(
                      color: Colors.orange[200],
                      blurRadius: 25,
                    )
                  ]),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 400),
              child: Column(
                children: [
                  // dnmButton(),

                  SizedBox(
                    height: 30,
                  ),
                  categoriesButton(context)
                ],
              ),
            ),
          )
        ])));
  }
}
