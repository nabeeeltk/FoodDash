import 'package:flutter/material.dart';
import 'package:fooddash/view/user_profile/add_new_adress.dart';
import 'package:get/get.dart';

class UserAdress extends StatelessWidget {
  const UserAdress({Key? key}) : super(key: key);

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
            ListView.separated(
              physics:const  NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                     
                        Image.asset("image/profileimg.png",width: 50,),
                        Text(
                          "Address ${index + 1}", 
                          style:const  TextStyle(fontSize: 16),
                        ),
                      const   Text(
                          "City, Postal Code", 
                          style: TextStyle(fontSize: 16),
                        ),
                      const   SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                               
                              },
                              child:const  Text('Edit'),
                            ),
                            TextButton(
                              onPressed: () {
                               
                              },
                              child:const  Text('Delete'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              
              },
              
              separatorBuilder: (context, index) => const Divider(thickness: 1, color: Colors.black),
              itemCount: 2, // Replace with the actual number of addresses
            ),
             const  SizedBox(height: 20,),
            MaterialButton(
              height: 40,
              color: Colors.orange,
              child:const  Text("ADD NEW ADDRESS +",style: TextStyle(fontSize: 18,color: Colors.white),),
              onPressed: (){
                Get.to( const AddNewAddress());
              })
          ],
        ),
      ),
    );
  }
}
