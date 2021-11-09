import 'package:get/get.dart';
import 'package:joke_app/Models/category.dart';
import 'package:joke_app/Requests/requests.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs;
  var cats = List<String>().obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  void fetchCategories() async {
    isLoading(true);
    try {
      var _categories = await Requests.getCategories();
      if (_categories != null) {
        cats.value = _categories;
      }
    } finally {
      isLoading(false);
    }
  }
}
