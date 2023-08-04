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
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios_new)),
        elevation: 0,
        title:const  Text('Track Order'),
      ),
      body: Padding(
        padding:const  EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order ID: $orderId',
                style:const  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
             const  SizedBox(height: 10),
              Text(
                'Status: $orderStatus',
                style:const  TextStyle(fontSize: 18),
              ),
           const    SizedBox(height: 20),
            const   Text(
                'Estimated Delivery Date:',
                style: TextStyle(fontSize: 18),
              ),
            const   Text(
                'August 10, 2023',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
             const  SizedBox(height: 10),
             const Text(
                'Order Details:',
                style: TextStyle(fontSize: 18),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics:const  NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  
                  return ListTile(
                    title: Text('Product Name ${index + 1}'),
                    subtitle:const  Text('Quantity: 2, Price: \$20'),
                  );
                },
              ),
            const   SizedBox(height: 10),
             const  Text(
                'Order Timeline:',
                style: TextStyle(fontSize: 18),
              ),
             const  SizedBox(height: 10),
              buildTimelineTile('Order Placed', '', isDeliveryStep: false),
              buildTimelineTile('Processing', 'August 2, 2023', isDeliveryStep: false),
              buildTimelineTile('Shipped', 'August 5, 2023', isDeliveryStep: false),
              buildTimelineTile('Out for Delivery', 'August 8, 2023', isDeliveryStep: true),
              buildTimelineTile('Delivered', 'August 10, 2023', isDeliveryStep: false),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimelineTile(String title, String date, {required bool isDeliveryStep}) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
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
          style:const  TextStyle(fontSize: 16),
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
