
import 'package:flutter/material.dart';

import 'package:fooddash/widget/oredr_status.dart';
import 'package:get/get.dart';

import '../../controller/car_controller.dart';
import '../../controller/owner/add_item_cotroller.dart';

class UserOrderPage extends StatelessWidget {
  final AddNewItemcontrller _controller = Get.put(AddNewItemcontrller());
    final MyCardController _cardController = Get.put(MyCardController());

    

   UserOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const Text("My Order",style: TextStyle(color: Colors.white),),
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon:const  Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
               final cartItems = _cardController.mycartItems; 
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var cartItems =_cardController.mycartItems[index];
                  
                   var item = _controller.menuItems[index];
                return InkWell(
                  onTap:() => Get.to(OrderStatus(mitem: cartItems,)) ,
                  child: Card(
                    color: Colors.grey.shade200,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration:  BoxDecoration(
                                    color: Colors.blueGrey,
                                    image: DecorationImage(image: NetworkImage(item.imageUrl.toString()),fit: BoxFit.cover)
                                  ),
                                ),
                              ),
                              Text(item.itemname.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              Padding(
                               padding:  EdgeInsets.all(8.0),
                               child:  Text(  "₹ ${item.itemPrice.toString()}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green)),
                             )
                            ],
                          ),
                        
                        ],
                      ),
                  ),
                );
              }, separatorBuilder: (context, index) {
                return const  SizedBox(height: 2,);
              }, itemCount: cartItems.length);
            },
            )
             
          ],
        ),
      ),
    );
  }
}