
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

class UserProfileController extends GetxController {
  File? _profileImage;
   String? _profileImageUrl; 
  // String? image;
   File? get profileImage => _profileImage;
  String? get profileImageUrl => _profileImageUrl;


  void chooseImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _profileImage = File(pickedFile.path);
      update(); // Notify GetX that the state has changed
    }
  }

  Future<void> uploadImageToFirebase(String userId) async {
    if (_profileImage == null) {
      print("No image selected.");
      return;
    }

    try {
      final storage = firebase_storage.FirebaseStorage.instance;
      final ref = storage.ref().child('profile_images/$userId.jpg');

      await ref.putFile(_profileImage!);

      String profileimageUrl = await ref.getDownloadURL();
      print("Image uploaded to Firebase Storage: $profileimageUrl");

      // You can save the `imageUrl` in your Firestore user profile document
      // or perform any other necessary actions with it.

    } catch (e) {
      print("Error uploading image to Firebase Storage: $e");
    }
  }
   Future<String?> fetchProfileImageUrl(String userId) async {
    try {
      final storage = firebase_storage.FirebaseStorage.instance;
      final ref = storage.ref().child('profile_images/$userId.jpg');

      _profileImageUrl = await ref.getDownloadURL();
       
      return _profileImageUrl;
      
    } catch (e) {
      print("Error fetching profile image URL: $e");
      return null;
    }
  }
}
