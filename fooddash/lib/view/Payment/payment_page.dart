import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatelessWidget {
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Payment'),
        leading: IconButton(onPressed: (){}, 
        icon:const  Icon(Icons.arrow_back_ios_new,size: 30,)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:const  EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: CreditCardForm(
                  cardHolderName: "Nabeel",
                  cardNumber: "65545631232",
                  cvvCode: "851",
                  expiryDate: "12/5/2024",
                  themeColor: Colors.red,
                  formKey: GlobalKey(),
                  cardHolderDecoration:const  InputDecoration(
                    labelText: 'Card Holder',
                  ),
                  cardNumberDecoration: InputDecoration(
                    labelText: 'Card Number',
                  ),
                  expiryDateDecoration: InputDecoration(
                    labelText: 'Expiration Date',
                  ),
                  cvvCodeDecoration: InputDecoration(
                    labelText: 'CVV',
                  ),
                  onCreditCardModelChange: (CreditCardModel creditCard) {
                    // Handle card details change
                  },
                ),
              ),
              SizedBox(height: 20),
              Text('Billing Address', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              TextFormField(
                controller: cardHolderController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: cardNumberController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextFormField(
                controller: expiryDateController,
                decoration: InputDecoration(labelText: 'City'),
              ),
              TextFormField(
                controller: cvvCodeController,
                decoration: InputDecoration(labelText: 'ZIP Code'),
              ),
              SizedBox(height: 20,),

              MaterialButton(
                color: Colors.orange.shade800,
                minWidth: double.infinity,
                height: 50,
                child: Text("Pay Now",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white)),
                onPressed: (){
       
                })
            ],
          ),
        ),
      ),

      
      // String cardHolder = cardHolderController.text;
      //    String cardNumber = cardNumberController.text;
      //     String expiryDate = expiryDateController.text;
      //    String cvvCode = cvvCodeController.text;
    );
  }
}
