import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TrackOrderPage extends StatelessWidget {
  final String orderId;
  final String orderStatus;

 const  TrackOrderPage({super.key, required this.orderId, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
        elevation: 0,
        title:const  Text('Track Order',style: TextStyle( color: Colors.white,),),
      ),
      body: Padding(
        padding:const  EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order ID: $orderId',
                style:const  TextStyle(
                  color: Colors.orange,
                  fontSize: 20, fontWeight: FontWeight.bold),
              ),
             const  SizedBox(height: 10),
              Text(
                'Status: $orderStatus',
                style:const  TextStyle(
                  color: Colors.white,
                  fontSize: 18),
              ),
           const    SizedBox(height: 20),
            const   Text(
                'Estimated Delivery Date:',
                style: TextStyle(fontSize: 18,
                 color: Colors.white,
                ),
              ),
            const   Text(
                'August 10, 2023',
                style: TextStyle(fontSize: 18,
                 color: Colors.white,
                 fontWeight: FontWeight.bold),
              ),
             const  SizedBox(height: 10),
             const Text(
                'Order Details:',
                style: TextStyle(fontSize: 18,
                 color: Colors.white,),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics:const  NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  
                  return ListTile(
                    title: Text('Product Name ${index + 1}',style: TextStyle( color: Colors.white,),),
                    subtitle:const  Text('Quantity: 2, Price: \$20',style: TextStyle( color: Colors.white,),),
                  );
                },
              ),
            const   SizedBox(height: 10),
             const  Text(
                'Order Timeline:',
                style: TextStyle(fontSize: 18,
                 color: Colors.orange,),
              ),
             const  SizedBox(height: 10),
              buildTimelineTile('Order Placed', '', isDeliveryStep: false,),
              buildTimelineTile('Processing', '', isDeliveryStep: false),
              buildTimelineTile('Shipped', '', isDeliveryStep: false),
              buildTimelineTile('Out for Delivery', '', isDeliveryStep: true),
              buildTimelineTile('Delivered', '', isDeliveryStep: false),
            ],
          )
        ),
      ),
    );
  }

  Widget buildTimelineTile(String title, String date, {required bool isDeliveryStep}) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.2,
      indicatorStyle: IndicatorStyle(
        width: 30,
        color: isDeliveryStep ? Colors.blue : Colors.green,
        iconStyle: IconStyle(
          color: Colors.white,
          iconData: isDeliveryStep ? Icons.delivery_dining : Icons.check_circle,
        ),
      ),
      beforeLineStyle:const  LineStyle(color: Colors.grey),
      endChild: Padding(
        padding:const  EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          title,
          style:const  TextStyle(fontSize: 16,color: Colors.white),
        ),
      ),
      afterLineStyle: LineStyle(color: isDeliveryStep ? Colors.blue : Colors.green),
      startChild: Padding(
        padding:const  EdgeInsets.only(left: 5.0),
        child: Text(
          date,
          style:const  TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
