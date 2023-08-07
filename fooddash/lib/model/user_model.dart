
import 'package:cloud_firestore/cloud_firestore.dart';


class UserModel{
  String?id, email, username;

  UserModel({this.email,this.id,this.username});
    factory UserModel.fromMap(DocumentSnapshot map){
      return UserModel(
             email: map["email"],
             id: map.id,
             username: map["username"]
      );
      
    }
    Map<String,dynamic>tomap(){
      return {
        // "id":id,
        "email":email,
        "username":username
      };
    }
  }
