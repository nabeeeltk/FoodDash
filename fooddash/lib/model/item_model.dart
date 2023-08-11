import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  String? id, itemname, itemDescription, ingredients, imageUrl;
  int? itemPrice;

  ItemModel({
    this.id,
    this.ingredients,
    this.itemPrice,
    this.itemDescription,
    this.itemname,
    this.imageUrl,
  });

  factory ItemModel.fromMap(DocumentSnapshot map) {
    return ItemModel(
      id: map.id,
      itemname: map["itemName"],
      itemPrice: int.tryParse(map['itemPrice'] ?? ''),
      ingredients: map["ingredients"],
      itemDescription: map["itemDescription"],
      imageUrl: map["imageUrl"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "itemName": itemname,
      "itemPrice": itemPrice,
      "ingredients": ingredients,
      "itemDescription": itemDescription,
      "imageUrl": imageUrl,
    };
  }
}
