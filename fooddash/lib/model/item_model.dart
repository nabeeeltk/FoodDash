import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  String? id, itemname, itemDescription, ingredients;
  int? itemPrice;

  ItemModel({
    this.id,
    this.ingredients,
    this.itemPrice,
    this.itemDescription,
    this.itemname,
  });

  factory ItemModel.fromMap(DocumentSnapshot map) {
    return ItemModel(
      id: map.id,
      itemname: map["itemName"],
      itemPrice: int.tryParse(map['itemPrice'] ?? ''),
      ingredients: map["ingredients"],
      itemDescription: map["itemDescription"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "itemName": itemname,
      "itemPrice": itemPrice,
      "ingredients": ingredients,
      "itemDescription": itemDescription,
    };
  }
}
