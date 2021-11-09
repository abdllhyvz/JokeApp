import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joke_app/Controllers/joke_controller.dart';
import 'package:joke_app/Screens/categories_page.dart';

class JokePage extends StatefulWidget {
  _JokePageState createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  final JokeController jokeController = Get.put(JokeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "JOKE FROM ${GetStorage().read("chosenCategory").toString().toUpperCase()}",
            style: TextStyle(),
          ),
          backgroundColor: Colors.orange[400],
        ),
        body: Container(
            child: Stack(children: [
          Opacity(
            opacity: 0.45,
            child: Image(
              image: AssetImage("assets/joker.jpg"),
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fitHeight,
            ),
          ),
          Obx(() {
            if (jokeController.isLoading.value) {
              return Center(
                child: CircularProgressIndicator().reactive(),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * .1,
                      left: MediaQuery.of(context).size.width * .1),
                  child: Text(
                    jokeController.joke.value.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * .06,
                        fontWeight: FontWeight.bold),
                  ),
                )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                ),
                Container(
                    alignment: Alignment.bottomCenter,
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
                            jokeController.fetchJoke();
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                  Colors.orange,
                                  Colors.orange[200]
                                ])),
                            child: Container(
                              constraints:
                                  BoxConstraints(maxHeight: 300, minWidth: 50),
                              alignment: Alignment.center,
                              child: Text(
                                "SEE ANOTHER JOKE FROM THIS CATEGORY",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * .03,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )))
              ],
            );
          })
        ])));
  }
}
