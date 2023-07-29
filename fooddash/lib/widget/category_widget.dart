import 'package:flutter/material.dart';

class AllCategoryWidget extends StatelessWidget {
  const AllCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
      height: 200,
      child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5, 
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding:const  EdgeInsets.only(right: 10), 
          child: InkWell(
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20)
                    ),
                  )
                ],
              ),
            ),
          ),
        
        );
      },
      ),
    ),
    );
  }
}