import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fooddash/view/Home/home_screen.dart';
import 'package:get/get.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key});

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
                        icon:const  Icon(Icons.arrow_back_ios)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Verification",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            const Text(
              "We have sent a code to your email",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const Text(
              "exaple@gmail.com",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                 const  Text("Enter your OTP"),
                 SizedBox(height: 10,),
                  OtpTextField(
                    
                    numberOfFields: 5,
                    borderColor: Colors.orange.shade700,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},

                    // onSubmit: (String verificationCode) {
                    // //   showDialog(

                    // //       context: context,
                    // //       builder: (context) {
                    // //         return AlertDialog(
                              
                    // //           title: Text("Verification Code"),
                    // //           content:
                    // //               Text('Code entered is $verificationCode'),
                    // //         );
                          
                    // //       }
                    // //       );
                    // // }, // end onSubmit
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      height: 50,
                      minWidth: double.infinity,
                      color: Colors.orange.shade800,
                      onPressed: () {
                        Get.to( const HomeScreen());
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
