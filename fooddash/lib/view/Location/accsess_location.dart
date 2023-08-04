import 'package:flutter/material.dart';
import 'package:fooddash/view/Home/home_screen.dart';
import 'package:get/get.dart';

class AcsessLocation extends StatelessWidget {
  const AcsessLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Center(
              child: Container(
                height: 250,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blueGrey),
              ),
            ),
           const  SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "DFOOD WILL ACCESS YOUR LOCATION\nONLY WHILE USING THE APP",
                style: TextStyle(color: Colors.black, fontSize: 20,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                height: 50,
                minWidth: double.infinity,
                color: Colors.orange.shade800,
                onPressed: () {
                  Get.to(const HomeScreen());
                },
                child: const Text(
                  "Access Location",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
