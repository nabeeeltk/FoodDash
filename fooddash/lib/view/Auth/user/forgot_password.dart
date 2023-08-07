import 'package:flutter/material.dart';
import 'package:fooddash/controller/auth/auth_contoller.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  final ctrl =Get.put(Authcontroller());
   ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 10, 17),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Forgot Password",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Please sign in to your existing account",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration:const  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
              topRight: Radius.circular(30))
            ),
            child: Column(
              children: [
               const  SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: ctrl.userresetemail,
                    decoration: InputDecoration(
                      hintText: "Enter Your Email",
                      prefixIcon: const Icon(Icons.email,color: Colors.black,),
                      fillColor: Colors.blueGrey.shade100,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                ),
               const  SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () =>  MaterialButton(
                      height: 50,
                      minWidth: double.infinity,
                      color: Colors.orange.shade700,
                      onPressed: (){
                        ctrl.resetpassword();
                      },
                    child:ctrl.loading.value?const CircularProgressIndicator(color: Colors.black,) :const Text("SEND CODE",style: TextStyle(color: Colors.white,fontSize: 20),),),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
