import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 30,)),
          title:const  Text("Help&Support",style: TextStyle(color: Colors.white),),
        ),
      body:const  SingleChildScrollView(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

             Padding(
               padding: EdgeInsets.all(8.0),
               child: Text("How do I place an order?",style: TextStyle(color: Colors.orange,fontSize: 20),),
             ),
             Padding(
               padding: EdgeInsets.all(8.0),
               child: Text("To place an order, follow these steps:",style: TextStyle(color: Colors.orange,fontSize: 18),),
         

             ),


              Padding(
               padding: EdgeInsets.all(8.0),
               child: Text("1. Open the Food Dash app.\n2. Browse through the menu and select items you want to order.\n3. Add items to your cart.\n4. Review your cart and proceed to checkout.\n5. Provide delivery details and choose a payment method.6. Confirm your order.",style: TextStyle(color: Colors.white,fontSize: 15),),

               
             ),

        Padding(
               padding: EdgeInsets.all(8.0),
               child: Text("Can I Track My Delivery?",style: TextStyle(color: Colors.orange,fontSize: 20),),
             ),
Padding(
               padding: EdgeInsets.all(8.0),
               child: Text("Yes, you can track your delivery in real-time. After placing an order, you'll receive a tracking link. Click on it to see the current status and estimated delivery time.",
               style: TextStyle(color: Colors.white,fontSize: 15),),
             ),

              Padding(
               padding: EdgeInsets.all(8.0),
               child: Text("Cutamer Support ",style: TextStyle(color: Colors.orange,fontSize: 20),),
             ),
               Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Text("For any assistance, reach out to our customer support team:\n- Email: support@fooddash.com\n- Phone: +123-456-7890",
                 style: TextStyle(color: Colors.white),),
               ),
               SizedBox(height: 20,),
               Center(
                child: Text("Version  0.01",style: TextStyle(color: Colors.grey,fontSize: 20),),
               )
          ],
        ),
      ),
    );
  }
}