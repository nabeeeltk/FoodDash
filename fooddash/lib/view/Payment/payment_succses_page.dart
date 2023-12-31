import 'package:flutter/material.dart';
import 'package:fooddash/view/home/home_screen.dart';
import 'package:fooddash/view/payment/track_order_page.dart';
import 'package:get/get.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const  Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
           const  SizedBox(height: 20),
           const  Text(
              'Payment Successful!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,),
            ),
          const   SizedBox(height: 10),
          const   Text(
              'Your payment was successfully processed.You successfully maked a payment,enjoy our service!',
              style: TextStyle(fontSize: 16, color: Colors.grey,),
              textAlign: TextAlign.center,
            ),
           const  SizedBox(height: 20),
          
      
         const  SizedBox(height: 20,),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              shape: Border.all(color: Colors.white),
              color: Colors.black,
              minWidth: double.infinity,
              height: 50,
              child:const  Text("Back to home", style: TextStyle(fontSize: 20,color: Colors.white),),
              onPressed: (){
                Get.to( HomeScreen());
              }),
          )
          ],
        ),
      ),
    );
  }
}
