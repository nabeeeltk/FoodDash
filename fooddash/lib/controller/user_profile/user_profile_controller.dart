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
      update(); 
      await uploadImageToFirebase("");
     
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

    final uploadTask = ref.putFile(profileImage!);

   
    final snapshot = await uploadTask.whenComplete(() {});
    profileImageUrl = await snapshot.ref.getDownloadURL();
    log("Image uploaded to Firebase Storage: $profileImageUrl");
  } catch (e) {
    log("Error uploading image to Firebase Storage: $e");
    Get.snackbar('Error', 'Failed to upload image to Firebase Storage');
  }
}


 Future<String?> fetchProfileImageUrl(String userId) async {
  try {
    final storage = firebase_storage.FirebaseStorage.instance;
    final ref = storage.ref().child('profile_images/$userId.jpg');

    final profileImageUrl = await ref.getDownloadURL();

    return profileImageUrl;
  } catch (e) {
    log("Error fetching profile image URL: $e");
    Get.snackbar('Error', 'Failed to fetch profile image URL');
    return null;
  }
}

}
