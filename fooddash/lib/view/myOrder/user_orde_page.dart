
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserOrderPage extends StatelessWidget {
  const UserOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
       
        title:const Text("My Order"),
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon:const  Icon(Icons.arrow_back_ios,size: 30,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
              return Card(
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
                              decoration:const  BoxDecoration(
                                color: Colors.blueGrey,
                                image: DecorationImage(image: AssetImage("image/Banner1.jpeg"),fit: BoxFit.cover)
                              ),
                            ),
                          ),
                         const  Text("Item Name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        const  Padding(
                           padding:  EdgeInsets.all(8.0),
                           child:  Text("Prize:#300",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green)),
                         )
                        ],
                      ),
                    
                    ],
                  ),
              );
            }, separatorBuilder: (context, index) {
              return const  SizedBox(height: 2,);
            }, itemCount: 3)
             
          ],
        ),
      ),
    );
  }
}