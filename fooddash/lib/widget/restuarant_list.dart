import 'package:flutter/material.dart';
import 'package:fooddash/view/RestuarentDetails/restuarebt_details_page.dart';
import 'package:get/get.dart';

class RestuarentWidget extends StatelessWidget {
  const RestuarentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: InkWell(
                  onTap: () {
                    Get.to(const RestuarentDetails());
                  },
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              image: const DecorationImage(
                                  image: AssetImage("image/pizza1.jpg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            "Rous Garden Restourent",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            "Location: Malappuram",
                            style: TextStyle(fontSize: 15),
                          ),
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
                                )),
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
                                )),
                            TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                label: const Text(
                                  "",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
