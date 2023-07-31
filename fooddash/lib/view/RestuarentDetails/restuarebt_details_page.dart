import 'package:flutter/material.dart';
import 'package:fooddash/view/FoodDetailsPage/food_details.dart';
import 'package:get/get.dart';

class RestuarentDetails extends StatelessWidget {
  const RestuarentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant Details"),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 230,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 30,
                  ),
                  label: const Text(
                    "4.7",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delivery_dining_sharp,
                    color: Colors.orange,
                    size: 30,
                  ),
                  label: const Text(
                    "Free",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "Rous Garden Restaurant",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "Maecenas sed diam eget risus varius blandit sit amet non magna.Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
                style: TextStyle(fontSize: 15),
              ),
            ),
          const  SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "All Items",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                 horizontalTitleGap: 5,
                  title: const Text("Burger Ferguson ",style: TextStyle(fontSize: 18,
                  fontWeight:FontWeight.bold ),),
                  subtitle:const  Text("Spicy restaurant  ",style: TextStyle(fontSize: 15,
                  
                  ),),
                  leading: Container(
                    height: 100,
                    width: 80,
                    decoration: const  BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("image/pizza1.jpg"),fit: BoxFit.cover)),
                  ),
                  onTap: (){
                    Get.to(FoodDetailsPage());
                  },
                  trailing:const Column(children: [
                    Text("#300",style: TextStyle(fontSize: 18,
                  fontWeight:FontWeight.bold ),),
                 
                  ],)
                  
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                    height: 50, thickness: 0, color: Colors.black);
              },
              itemCount: 5,
            ),
          ],
        ),
      ),
    );
  }
}
