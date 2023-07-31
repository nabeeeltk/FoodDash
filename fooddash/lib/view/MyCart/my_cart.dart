import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30,
            )),
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                      horizontalTitleGap: 3,
                      title: const Text(
                        "Pizza Ferguson ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      subtitle: const Text(
                        "Spicy restaurant  ",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      leading: Container(
                        height: 100,
                        width: 80,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("image/pizza1.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      onTap: () {},
                      trailing: const Column(
                        children: [
                          Text(
                            "#300",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          ),
                        ],
                      ));
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                      height: 50, thickness: 0, color: Colors.white);
                },
                itemCount: 3,
              ),

              
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                   Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        
                        decoration: InputDecoration(
                          hintText: "Enter Adress",
                            fillColor: Colors.blueGrey,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                            )),
                      ),
                    ),
                    const Text(
                      "TOTAL #2000",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                          color: Colors.orange.shade800,
                          minWidth: double.infinity,
                          height: 50,
                          child: const Text(
                            "PLACE ORDER",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {}),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
