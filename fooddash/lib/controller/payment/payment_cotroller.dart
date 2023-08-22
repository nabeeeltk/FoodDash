import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddash/controller/car_controller.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../view/payment/payment_succses_page.dart';

class PaymentController extends GetxController {
  final Razorpay _razorpay = Razorpay();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final MyCardController _cardController = Get.put(MyCardController());


  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Payment successful, store payment data in Firebase
    await _firestore.collection('payments').add({
      'amount': response.paymentId,
      'timestamp': Timestamp.now(),
    });

    Get.to(const PaymentSuccessPage());
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

  void initiatePayment() {
    final options = {
      'key': 'rzp_test_SNZ3CCn30y0Aq3',
      'amount': 1000,
      'name': 'FoodDash',
      'description': 'Order Payment',
      'prefill': {'contact': '1234567890', 'email': 'test@example.com'},
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
  }

  @override
  void dispose() {
    _razorpay.clear(); // Clear the event listeners when the controller is disposed
    super.dispose();
  }
   
}