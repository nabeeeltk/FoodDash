import 'package:flutter/material.dart';
import 'package:fooddash/controller/time_line_controller.dart';
import 'package:get/get.dart';

class UpdateOrderStatus extends StatelessWidget {
    final TimelineController  _timelineController = Get.put(TimelineController());
 UpdateOrderStatus({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:const  Text("OrderStatus",
        style: TextStyle(color: Colors.white),),
         backgroundColor: Colors.black,
         leading: IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,)),

      ),
      body:  SingleChildScrollView(
        child: 
        Column(
          children: [
                 Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _timelineController.title,
                    decoration:const  InputDecoration(
                      hintText: "Tittile",hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none
                      )
                    ),
                  ),
                ),
               
                 Padding(
                  padding:const  EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _timelineController.description,
                    decoration: const InputDecoration(
                       fillColor: Colors.white,
                      filled: true,
                       hintText: "description",hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                         borderSide: BorderSide.none
                      )
                    ),
                  ),
                ),
              //  const  Padding(
              //     padding: EdgeInsets.all(8.0),
              //     child: TextField(
              //       decoration: InputDecoration(
              //          hintText: "Date&Time",hintStyle: TextStyle(color: Colors.grey),
              //         border: OutlineInputBorder()
              //       ),
              //     ),
              //   ),
                MaterialButton(onPressed: (){
                    _timelineController.addTimelineItem();
                },
                child: Text("Submit"),
                color: Colors.orange,)
          ],
        ),
      ),
    );
  }
}