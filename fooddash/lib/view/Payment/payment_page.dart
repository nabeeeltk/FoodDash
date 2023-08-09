import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:fooddash/view/payment/payment_succses_page.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvCodeController = TextEditingController();

  PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      appBar: AppBar(
          backgroundColor:Colors.black,
        title: const Text('Payment',style: TextStyle(color: Colors.white),),
        leading: IconButton(
          onPressed: () {},
          icon:const  Icon(Icons.arrow_back_ios_new, size: 30,color: Colors.white,),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient:const  LinearGradient(
                    colors: [Colors.yellow, Colors.orange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: CreditCardForm(
                  cardHolderName: "",
                  cardNumber: "6554 5631 2320",
                  cvvCode: "851",
                  expiryDate: "12/24",
                  themeColor: Colors.white,
                  formKey: GlobalKey(),
                  cardHolderDecoration: const InputDecoration(
                    labelText: 'Card Holder',
                    labelStyle: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  cardNumberDecoration: const InputDecoration(
                    labelText: 'Card Number',
                    labelStyle: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  expiryDateDecoration: const InputDecoration(
                    labelText: 'Expiration Date',
                    labelStyle: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  cvvCodeDecoration: const InputDecoration(
                    labelText: 'CVV',
                    labelStyle: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  onCreditCardModelChange: (CreditCardModel creditCard) {
                    // Handle card details change
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Billing Address',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.orange),
              ),
              TextFormField(
                controller: cardHolderController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              TextFormField(
                controller: cardNumberController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              TextFormField(
                controller: expiryDateController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              
              const SizedBox(height: 20),

              MaterialButton(
                color: Colors.orange.shade800,
                minWidth: double.infinity,
                height: 50,
                child: const Text(
                  "Pay Now",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Get.to(const PaymentSuccessPage());
                },
              )
            ],
          ),
        ),
      ),

      // String cardHolder = cardHolderController.text;
      // String cardNumber = cardNumberController.text;
      // String expiryDate = expiryDateController.text;
      // String cvvCode = cvvCodeController.text;
    );
  }
}
