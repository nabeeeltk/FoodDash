import 'package:flutter/material.dart';
import 'package:fooddash/widget/food_item_list.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
 final TextEditingController searchController = TextEditingController();
  final _searchResults = <String>[].obs;

  List<String> simulateSearch(String query) {
    // Replace this with your actual search logic
    List<String> data = FoodItemList() as List<String>;
    return data.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
  }

  void onSearchChanged(String query) {
    debounce(query);
  }

  void debounce(String query) {
    Future.delayed(Duration(milliseconds: 300), () {
      List<String> results = simulateSearch(query); // Simulated search function
      _searchResults.assignAll(results);
    });
  }
}

