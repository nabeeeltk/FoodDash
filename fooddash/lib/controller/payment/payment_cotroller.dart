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
      int itemCount = _cardController.itemCount.toInt();
      double itemPrice = double.parse(item.itemPrice.toString());
      totalPrize += itemCount * itemPrice;
    }
    return totalPrize;
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    double paymentAmount = calculateTotalPrice();

    await _firestore.collection('payments').add({
      'amount': paymentAmount.toDouble(),
      'timestamp': Timestamp.now(),
    });
    log(paymentAmount.toString());

    Get.to(const PaymentSuccessPage());
  }

 Future<double> getTotalAmount() async {
  double totalAmount = 0.0;
  CollectionReference paymentsCollection =
  FirebaseFirestore.instance.collection('payments');
  try {
    QuerySnapshot querySnapshot = await paymentsCollection.get();
    for (QueryDocumentSnapshot document in querySnapshot.docs) {
      String? paymentAmountString = document.get('amount');
      if (paymentAmountString != null) {
        double? paymentAmount = double.tryParse(paymentAmountString);
        if (paymentAmount != null) {
          totalAmount += paymentAmount;
        } else {
          log("Invalid 'amount' value: $paymentAmountString");
        }
      } else {
        log("'amount' field is missing in document: ${document.id}");
      }
    }
  } catch (e) {
    log('Error fetching payment data: $e');
    log('Total amount: $totalAmount');
  }

  return totalAmount;
}


  void _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar('Payment Error', 'Payment failed: ${response.message}',
        backgroundColor: Colors.white);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}

  void initiatePayment() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      final options = {
        'key': 'rzp_test_SNZ3CCn30y0Aq3',
        'amount': calculateTotalPrice() * 100,
        'name': 'FoodDash',
        'description': 'Order Payment',
        'prefill': {'contact': '9638527410', 'email': user.email},
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
    } else {}
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
