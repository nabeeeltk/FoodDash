import 'package:flutter/material.dart';
import 'package:fooddash/view/Home/home_screen.dart';
import 'package:fooddash/view/Payment/track_order_page.dart';
import 'package:get/get.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          const   SizedBox(height: 10),
          const   Text(
              'Your payment was successfully processed.You successfully maked a payment,enjoy our service!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
           const  SizedBox(height: 20),
          

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Colors.orange.shade800,
              minWidth: double.infinity,
              height: 50,
              child:const  Text("Track Order", style: TextStyle(fontSize: 20,color: Colors.white),),
              onPressed: (){

                
             Get.to(const TrackOrderPage(orderId: '#5452',orderStatus: "Upadate",))  ;
              }),
          ),
         const  SizedBox(height: 20,),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              shape: Border.all(),
              color: Colors.white,
              minWidth: double.infinity,
              height: 50,
              child:const  Text("Back to home", style: TextStyle(fontSize: 20,color: Colors.black),),
              onPressed: (){
                Get.to(const HomeScreen());
              }),
          )
          ],
        ),
      ),
    );
  }
}
