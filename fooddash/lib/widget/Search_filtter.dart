import 'package:flutter/material.dart';
import 'package:fooddash/controller/owner/add_item_cotroller.dart';
import 'package:fooddash/controller/search_controller.dart';
import 'package:get/get.dart';

class SearchWidget extends StatelessWidget {
   SearchWidget({super.key});
   final  AddNewItemcontrller _addNewItemcontrller =Get.put(AddNewItemcontrller());
   final SearchControllerPage _searchController = Get.put(SearchControllerPage());
   

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextField(
                controller: _searchController.searchController,
                 onChanged: (value) {
                  _searchController.updateSearchResults(value);
                 },
                textAlign: TextAlign.start,
                cursorHeight: 25,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: "Search dishes",
                    hintStyle: const TextStyle(fontSize: 18),
                    fillColor: Colors.grey.shade400,
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Container(
                height: 55,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                    onPressed: () {
                      showMenu(
                          context: context,
                          position: const RelativeRect.fromLTRB(
                              100, 100, 0, 0), // Adjust the posit ,
                          items: [
                            const PopupMenuItem(
                              value: "All",
                              child: ListTile(
                                title: Text('All'),
                              ),
                            ),
                            const PopupMenuItem(
                              value: 'Vegetable',
                              child: ListTile(
                                title: Text('Vegetable'),
                              ),
                            ),
                            const PopupMenuItem(
                              value: 'Non Vegetable',
                              child: ListTile(
                                title: Text('Non Vegetable'),
                              ),
                            ),
                          ]).then((value) {
                        if (value == "All") {
                        } else if (value == "Vegetable") {
                          if(_addNewItemcontrller.isVeg.isTrue){
                            return _addNewItemcontrller.filteredItems;
                          }
                        } else if (value == "Non Vegetable");
                      });
                    },
                    icon: const Icon(
                      Icons.restaurant_menu,
                      size: 30,
                      color: Colors.black,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
