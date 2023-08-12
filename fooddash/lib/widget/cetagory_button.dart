import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {

  String  text;
   CategoryButton({super.key   , required this.text});
   
  @override
  Widget build(BuildContext context) {
    return  InkWell(
                      onTap: () {
                        
                      },
                       child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(child: Text(text,style:const  TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold,color: Colors.white),)),
                       ),
                     );
  }
}