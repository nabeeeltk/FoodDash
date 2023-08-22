import 'package:get/get.dart';

class SearchController extends GetxController {
  RxString searchQuery = RxString('');

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}
