import 'dart:math';

String generateOrderId() {
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  int random = Random().nextInt(9000) + 1000;

  String orderId = '$timestamp$random';

  return orderId;
}
