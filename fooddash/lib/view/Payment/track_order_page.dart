import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/time_line_controller.dart';

class TimelineWidget extends StatelessWidget {
  final TimelineController controller = Get.put(TimelineController());

  TimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
         leading: IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,)),
        backgroundColor: Colors.black,
        title:const  Text('Track Order',style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder(
        future:controller.fetchTimelineItems(),
        builder: (context, snapshot) => 
         Obx(
          () => ListView.builder(
            itemCount: controller.timelineItems.length,
            itemBuilder: (context, index) {
              final item = controller.timelineItems[index];
              return ListTile(
              leading:const  Icon(Icons.turn_right,size: 30,color: Colors.green,),
                title: Text(item.title,style: const TextStyle(color: Colors.white)),
                subtitle: Text(item.description,style:const  TextStyle(color: Colors.white)),
                trailing: Text(
                  '${item.dateTime.year}-${item.dateTime.month}-${item.dateTime.day}',style:const  TextStyle(color: Colors.white)
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
