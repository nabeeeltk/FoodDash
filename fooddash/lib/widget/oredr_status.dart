import 'package:flutter/material.dart';
import 'package:get/get.dart';


// import '../controller/order_controller.dart';
import '../controller/time_line_controller.dart';
import '../controller/user_adress_controller.dart';
import '../model/Item_model.dart';

// ignore: must_be_immutable
class OrderStatus extends StatelessWidget {
  UserAddressController _addressController = Get.put(UserAddressController());
  final TimelineController controller = Get.put(TimelineController());
  //  final OrderController _orderController = Get.put(OrderController());
  final ItemModel mitem;

  OrderStatus({required this.mitem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new, size: 30, color: Colors.white),
        ),
        title: Text("Order Status", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _addressController.fetchAddresses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Handle loading state
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            final firstAddress = _addressController.addresses[0];
            // ignore: unused_local_variable
            final firstTimelineItem = controller.timelineItems.isNotEmpty
                ? controller.timelineItems[0]
                : null;

            return ListView.builder(
              
              itemCount: 1,
              itemBuilder: (context, index) {
                
                return Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  height: 250,
                  color: Colors.orange,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 110,
                              width: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    mitem.imageUrl.toString(),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Item Name: ${mitem.itemname}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "Item Price: ₹${mitem.itemPrice.toString()}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "User: ${firstAddress.name}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "City: ${firstAddress.city}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Place: ${firstAddress.address}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(controller.title.text)
                    ],
                  ),
                ),
              );
              },
            );
          }
        },
      ),
    );
  }
}
