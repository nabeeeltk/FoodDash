
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fooddash/controller/car_controller.dart';
import 'package:fooddash/controller/owner/add_item_cotroller.dart';
import 'package:fooddash/controller/payment/payment_cotroller.dart';
import 'package:fooddash/controller/user_adress_controller.dart';
import 'package:fooddash/view/user_profile/add_new_adress.dart';
import 'package:get/get.dart';

import '../../controller/order_controller.dart';
import '../../model/order_model.dart';
import '../../widget/orderid.dart';

class UserAdress extends StatelessWidget {
   UserAdress({Key? key}) : super(key: key);
final UserAddressController  _addressController  =Get.put(UserAddressController());
   final PaymentController  _paymentController = Get.put(PaymentController());
   final OrderController  _ordercontroller= Get.put(OrderController());
   final AddNewItemcontrller _addNewItemcontrller =Get.put(AddNewItemcontrller());
   final MyCardController _cardController=Get.put(MyCardController());
  
  @override
  Widget build(BuildContext context) {

    
   
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
          const   SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    radius: 20,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon:const  Icon(Icons.arrow_back_ios),
                    ),
                  ),
                 const  SizedBox(width: 20),
                 const  Text(
                    "My Address",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            ),
          const   SizedBox(height: 20),
        FutureBuilder(
          future: _addressController.fetchAddresses(),
          builder: (context, snapshot) => 
           Obx(()=>
              ListView.separated(
              physics:const  NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
              final adresitem= _addressController.addresses[index];
                return  Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(adresitem.name.toString(),
                            style: const TextStyle(color: Colors.black,fontSize: 18,
                            fontWeight: FontWeight.bold),),
                             IconButton(onPressed: (){
                              showDialog(context: context, builder:(context) {
                                return AlertDialog(
                                  content: const Text("Delete?"),
                                title:const  Text("Are You Sure!"),
                                actions: [
                                   TextButton(onPressed: (){
                                    Get.back();
                                  }, child:const  Text("Cancel")),
                                  TextButton(onPressed: (){
                                     _addressController.deleteAddress(adresitem);
                                  }, child:const  Text("ok",style: TextStyle(color: Colors.red),)),
                                 
                                ],
                                );
                              },);
                             
                             }, icon:const  Icon(Icons.cancel)),
                          ],
                         ),
                          Text(adresitem.city.toString()),
                         
                          Text(adresitem.address.toString()),
                
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(adresitem. phoneNumber.toString()),
                              
                                Obx(
            () => Checkbox(
              value: _addressController.selectedCheckboxes[index].value,
              onChanged: (newValue) {
                int selectedAddressIndex = -1;
                _addressController.handleCheckboxChange(index, newValue!);
                if (newValue!) {
                  selectedAddressIndex = index;
                } else {
                  selectedAddressIndex = -1; // Deselect the address
                }
              },
            ),
          ),
                            ],
                          )
                
                      ],
                    ),
                  ),
                );
              
              },
              
              separatorBuilder: (context, index) => const Divider(thickness: 1, color: Colors.black),
              itemCount: _addressController.addresses.length, // Replace with the actual number of addresses
                     ),
           ),
        ),
             const  SizedBox(height: 20,),
            MaterialButton(
              minWidth: 250,
              height: 40,
                
              color: Colors.green,
            
              child:const  Text("Confirm Order",style: TextStyle(fontSize: 18,color: Colors.white),),
              onPressed: () async{
                 final cartItems = _cardController.mycartItems;
                _paymentController.initiatePayment();
                placeOrder();
                _cardController.removeItemFromCart(cartItems[0]);
                log("All Cart items cleared");
              }),
               MaterialButton(
              minWidth: 250,
              height: 40,
              
              color: Colors.orange,
              child:const  Text("Add New Adress",style: TextStyle(fontSize: 18,color: Colors.white),),
              onPressed: (){
                Get.to(  AddNewAddress());
              }),

          ],
        ),
      ),
    );
  }
   void placeOrder() async {
     
    
  final adresitem = _addressController.addresses[0]; 
  final shippingAddress = _addressController.addresses[0]; 
  final itemName = _addNewItemcontrller.menuItems[0]; 
    final order = OrderDetails(
     orderId: generateOrderId() ,
    customerName: adresitem.name.toString(), 
    shippingAddress: shippingAddress.address.toString(),
    orderDate: DateTime.now(), 
    itemName: itemName.itemname.toString()
    );

    await _ordercontroller.addOrderDetails(order);
  }
}
