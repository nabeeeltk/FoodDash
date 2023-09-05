import 'package:flutter/material.dart';
import 'package:fooddash/controller/payment/payment_cotroller.dart';
import 'package:fooddash/view/shop_owner/owner_food_item_list.dart';
import 'package:fooddash/widget/search_filtter.dart';
import 'package:get/get.dart';
import '../../controller/order_controller.dart';

class ShopeHomeScreen extends StatelessWidget {
  ShopeHomeScreen({super.key});
  final PaymentController _paymentController = Get.put(PaymentController());
  final OrderController _orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Welcome",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Shope Owner",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              spreadRadius: 2)
                        ],
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder(
                          future: _paymentController.getTotalAmount(),
                          builder: (context, countSnapshot) {
                            if (countSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              const CircularProgressIndicator();
                            }
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 8),
                              child: Text(
                                ordercount().toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 40),
                              ),
                            );
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Total Order",
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              spreadRadius: 2)
                        ],
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 8),
                          child: FutureBuilder(
                            future: _paymentController.getTotalAmount(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }
                              return Text(
                                snapshot.data!.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              );
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Total Revenue",
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SearchWidget(),
            OwnerFoodItemList()
          ],
        ),
      ),
    );
  }

  ordercount() {
    final count = _orderController.orders.length;
    return count;
  }
}
