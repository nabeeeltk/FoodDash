import 'package:flutter/material.dart';
import 'package:fooddash/widget/food_item_list.dart';
import 'package:get/get.dart';
class SearchController extends GetxController {
   final TextEditingController searchController = TextEditingController();
  final RxList<String> _searchResults = <String>[].obs;

  RxList<String> get searchResults => _searchResults;

  List<String> simulateSearch(String query) {
  
    List<String> data = FoodItemList() as List<String>; 
    return data.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
  }

  void updateSearchResults(String query) {
    List<String> results = simulateSearch(query); // Simulated search function
    _searchResults.assignAll(results);
  }
}



