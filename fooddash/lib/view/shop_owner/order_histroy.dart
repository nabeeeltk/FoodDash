import 'package:flutter/material.dart';
import 'package:fooddash/controller/order_controller.dart';
import 'package:fooddash/view/shop_owner/update_status.dart';
import 'package:get/get.dart';

class OrderHistroy extends StatelessWidget {

  final OrderController _orderController = Get.put(OrderController());
   OrderHistroy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const  Text("Order Details",style: TextStyle(color: Colors.white)),
        backgroundColor:Colors.black ,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios,
        color: Colors.white,size: 30,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             FutureBuilder(
              future:_orderController.fetchOrders() ,
              builder: (context, snapshot) => 
                ListView.separated(
                 physics:const  NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final order = _orderController.orders[index];
                  return  Padding(
                    padding:const   EdgeInsets.all(8.0),
                    child:  InkWell(
                      onTap: () {
                        Get.to(UpdateOrderStatus());
                      },
                      child: Card(
                      
                        elevation: 4,
                        child:  Padding(
                          padding:const  EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment:MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                   
                                        
                                   Text(order.customerName,style:const  TextStyle(fontSize: 20)),
                                   Text(order.itemName,style:const  TextStyle(fontSize: 18)),
                                   Text(order.shippingAddress,style:const  TextStyle(fontSize: 18)),
                                   Text(order.orderDate.toString(),style:const  TextStyle(fontSize: 18)),
                                   Text(order.orderId,style: const TextStyle(fontSize: 18),),   
                            ],
                          ),
                        ) ,
                      ),
                    ),
                  );
               }, separatorBuilder: (context, index) {
                return const  Divider(thickness: 1,);
                 
               }, itemCount:_orderController.orders.length),
             )
          ],
        ),
      ),
    );

  }
}