import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joke_app/Models/joke.dart';
import 'package:joke_app/Requests/requests.dart';

class JokeController extends GetxController {
  var isLoading = true.obs;
  var joke = Joke().obs;

  @override
  void onInit() {
    fetchJoke();
    super.onInit();
  }

  void fetchJoke() async {
    isLoading(true);
    try {
      var chosenCategory = GetStorage().read("chosenCategory");
      var _joke = await Requests.getJoke(chosenCategory);
      if (_joke != null) {
        joke.value = _joke;
      }
    } finally {
      isLoading(false);
    }
  }
}
