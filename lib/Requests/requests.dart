import 'dart:convert';

import 'package:get/get.dart';
import 'package:joke_app/Models/category.dart';
import 'package:http/http.dart' as http;
import 'package:joke_app/Models/joke.dart';

class Requests {
  static var client = http.Client();

  static Future<List<String>> getCategories() async {
    var url = "https://api.chucknorris.io/jokes/categories";
    try {
      var response =
          await client.get(Uri.parse(url)).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        Categories _categories = new Categories();
        var responseBody = response.body;
        return _categories.categoriesFromJson(responseBody);
      }
    } catch (error) {
      return null;
    }
  }

  static Future<Joke> getJoke(String chosenCategory) async {
    var url =
        "https://api.chucknorris.io/jokes/random?category=${chosenCategory}";
    try {
      var response =
          await client.get(Uri.parse(url)).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        Joke _joke = new Joke();
        var responseBody = response.body;
        return _joke.jokeFromJson(responseBody);
      }
    } catch (error) {
      return null;
    }
  }
}
