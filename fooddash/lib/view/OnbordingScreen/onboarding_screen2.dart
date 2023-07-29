import 'package:flutter/material.dart';
import 'package:fooddash/view/Auth/user_log_in.dart';
import 'package:get/get.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
          const   SizedBox(height: 100,),
            Center(
              child: Container(
                height: 250,
                width:200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade600
                    ),
              ),
            ),
           const  SizedBox(height: 20,),

          const  Text("All your favorites",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
          ),
          const  Text("Get all your loved foods in one once place \n  you just place the orer we do the rest",
          style: TextStyle(fontSize: 18)),
         const  SizedBox(height: 30,),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(

              onPressed: (){
                 Get.to(const UserLogin());
            },
            color: Colors.orange.shade800,
            height: 50,
            minWidth: double.infinity,
            child:const  Text("NEXT",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),),
          ),
          const   SizedBox(height: 10,),
            Padding(
            padding: const EdgeInsets.all(10),
            child: MaterialButton(onPressed: (){
           
            },
            color: Colors.white,
            height: 50,
            minWidth: double.infinity,
            child:const  Text("SKIP2",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),),
          ),
          ],
        ),
      ),
    );
  }
}