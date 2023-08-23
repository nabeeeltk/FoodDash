import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddash/controller/car_controller.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../view/payment/payment_succses_page.dart';

class PaymentController extends GetxController {
  final Razorpay _razorpay = Razorpay();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final MyCardController _cardController = Get.put(MyCardController());
     RxDouble totalRevenue = RxDouble(0.0);

    double calculateTotalPrice() {
  double totalPrize = 0.0;
  for (var item in _cardController.mycartItems) {
    int itemCount = _cardController.itemCount.toInt();// Get the item count for this specific item
    double itemPrice = double.parse(item.itemPrice.toString());
    totalPrize += itemCount * itemPrice;
  }
  return totalPrize;
}

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Payment successful, store payment data in Firebase
    await _firestore.collection('payments').add({
      'amount': response.paymentId,
      'timestamp': Timestamp.now(),
    });

    Get.to(const PaymentSuccessPage());
  }
 Stream<double> getTotalRevenueStream() {
  return _firestore
      .collection('payments')
      .snapshots()
      .map((querySnapshot) {
        double sum = 0.0;
        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          double paymentAmount = document.get('amount') ?? 0.0;
          sum += paymentAmount;
        }
        log(sum.toString());
        return sum;
      });
}

     

  void _handlePaymentError(PaymentFailureResponse response) {
    // Payment failed, handle error
    Get.snackbar(
    
      'Payment Error', 'Payment failed: ${response.message}',
      backgroundColor: Colors.white
      );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet response if needed
  }

  void initiatePayment() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;

  if (user != null) {
    final options = {
      'key': 'rzp_test_SNZ3CCn30y0Aq3',
      'amount': calculateTotalPrice()*100,
      'name': 'FoodDash',
      'description': 'Order Payment',
      'prefill': {'contact': '1234567890', 'email': user.email}, // Use user's email
      'external': {
        'wallets': ['paytm']
      }
    };

    _razorpay.open(options);
    _razorpay.on(
      Razorpay.EVENT_PAYMENT_SUCCESS,
      _handlePaymentSuccess,
    );
    _razorpay.on(
      Razorpay.EVENT_PAYMENT_ERROR,
      _handlePaymentError,
    );
    _razorpay.on(
      Razorpay.EVENT_EXTERNAL_WALLET,
      _handleExternalWallet,
    );
  } else {
    // Handle the case when the user is not authenticated
  }
}

  @override
  void dispose() {
    _razorpay.clear(); // Clear the event listeners when the controller is disposed
    super.dispose();
  }
   
}