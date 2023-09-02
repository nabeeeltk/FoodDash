import 'package:get/get.dart';

class MessagingController extends GetxController {
  RxList<String> messages = <String>[].obs;

  void sendMessage(String message) {
    messages.add(message);
  }
}
