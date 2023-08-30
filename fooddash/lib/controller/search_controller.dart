// import 'package:flutter/material.dart';
// import 'package:fooddash/widget/food_item_list.dart';
// import 'package:get/get.dart';
// class SearchControllerPage extends GetxController {
//    final TextEditingController searchController = TextEditingController();
//  RxList<String> _searchResults = <String>[].obs;

//   RxList<String> get searchResults => _searchResults;

//   List<String> simulateSearch(String query) {
  
//     List<String> data = FoodItemList() as List<String>; 
//     return data.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
//   }

//   void updateSearchResults(String query) {
//     List<String> results = simulateSearch(query); // Simulated search function
//     _searchResults.assignAll(results);
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/food_item_list.dart';

class SearchControllerPage extends GetxController {
  final TextEditingController searchController = TextEditingController();
  RxList<String> _searchResults = <String>[].obs;

  RxList<String> get searchResults => _searchResults;

  void updateSearchResults(String query) {
    log('queryy ======= $query');
    List<String> results = simulateSearch(query);
    _searchResults.assignAll(results);
  }

  List<String> simulateSearch(String query) {
    List<String> data = FoodItemList().getMenuItemsNames();
    return data.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
  }
}


