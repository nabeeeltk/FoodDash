import 'package:get/get.dart';

class SearchController extends GetxController {
  var searchText = ''.obs;

  void setSearchText(String text) {
    searchText.value = text;
  }
}

