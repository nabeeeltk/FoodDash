import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UserProfileController extends GetxController {
  File? profileImage;
  String? profileImageUrl;

  void chooseImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      update(); // Notify GetX that the state has changed
    }
  }

  Future<void> uploadImageToFirebase(String userId) async {
    if (profileImage == null) {
      log("No image selected.");
      return;
    }

    try {
      final storage = firebase_storage.FirebaseStorage.instance;
      final ref = storage.ref().child('profile_images/$userId.jpg');

      await ref.putFile(profileImage!);

      profileImageUrl = await ref.getDownloadURL();
      log("Image uploaded to Firebase Storage: $profileImageUrl");

      // You can save the `profileImageUrl` in your Firestore user profile document
      // or perform any other necessary actions with it.
    } catch (e) {
      log("Error uploading image to Firebase Storage: $e");
      Get.snackbar('Error', 'Failed to upload image to Firebase Storage');
    }
  }

  Future<String?> fetchProfileImageUrl(String userId) async {
    try {
      final storage = firebase_storage.FirebaseStorage.instance;
      final ref = storage.ref().child('profile_images/$userId.jpg');

      profileImageUrl = await ref.getDownloadURL();

      return profileImageUrl;
    } catch (e) {
      log("Error fetching profile image URL: $e");
      Get.snackbar('Error', 'Failed to fetch profile image URL');
      return null;
    }
  }
}
