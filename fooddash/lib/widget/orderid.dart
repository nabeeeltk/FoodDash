import 'dart:math';


String generateOrderId() {
  // Get the current timestamp in milliseconds.
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  // Generate a random number between 1000 and 9999.
  int random = Random().nextInt(9000) + 1000;

  // Combine the timestamp and random number to create the order ID.
  String orderId = '$timestamp$random';

  return orderId ;
}