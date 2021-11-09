import 'dart:convert';

class Categories {
  List<String> categoriesFromJson(String str) =>
      List<String>.from(json.decode(str).map((x) => x));
}
