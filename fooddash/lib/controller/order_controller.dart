import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/order_model.dart';

class OrderController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   RxList<OrderDetails> orders = <OrderDetails>[].obs;


  Future<void> addOrderDetails(OrderDetails order) async {
    try {
      await _firestore.collection('orders').add(order.toJson());
      // Order details added successfully.
    } catch (error) {
      // Handle the error.
      print('Error adding order: $error');
    }
  }
 Future<void> fetchOrders() async {
  try {
    final querySnapshot = await _firestore.collection('orders').get();

    orders.value = querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return OrderDetails(
        orderId: doc.id, // Use the Firestore document ID as the orderId
        customerName: data['customerName'] ?? '',
        shippingAddress: data['shippingAddress'] ?? '',
        itemName: data['itemName'] ?? '',
        orderDate: DateTime.tryParse(data['orderDate']) ?? DateTime.now(),
      );
    }).toList();

    print('Orders fetched from Firestore');
  } catch (error) {
    print('Error fetching orders from Firestore: $error');
  }
}

}
