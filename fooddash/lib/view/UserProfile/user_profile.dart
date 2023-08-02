import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
            )),
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Card(
            color: Color.fromARGB(255, 196, 217, 234),
            elevation: 0,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 50,
                      ),
                    ),
                    Text("User Name"),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Color.fromARGB(255, 196, 217, 234),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.person),
                        const Text("Personol ifo"),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.place),
                        const Text("Address"),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: const Color.fromARGB(255, 196, 217, 234),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.shopping_bag),
                        const Text(" My Cart"),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.shop),
                        const Text("My Order"),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.list),
                        const Text("About"),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.share),
                        const Text("Share"),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Color.fromARGB(255, 196, 217, 234),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.logout),
                        const Text("log Out"),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text("Version: 0.0.1")
        ]),
      ),
    );
  }
}
