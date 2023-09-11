import 'package:cloud_firestore/cloud_firestore.dart';

class ShopOwnerModel {
  String? id;
  String? email;
  String? shopName;

  ShopOwnerModel({this.email, this.id, this.shopName});

  factory ShopOwnerModel.fromMap(DocumentSnapshot map) {
    return ShopOwnerModel(
      email: map["email"],
      id: map.id,
      shopName: map["shopName"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "shopName": shopName,
    };
  }
}
