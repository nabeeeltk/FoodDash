import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

Widget buildTimelineTile(String title, String date, {required bool isDeliveryStep}) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      indicatorStyle: IndicatorStyle(
        width: 20,
        color: isDeliveryStep ? Colors.blue : Colors.green,
        iconStyle: IconStyle(
          color: Colors.white,
          iconData: isDeliveryStep ? Icons.delivery_dining : Icons.check_circle,
        ),
      ),
      beforeLineStyle:const  LineStyle(color: Colors.grey),
      endChild: Padding(
        padding:const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          title,
          style:const TextStyle(fontSize: 16),
        ),
      ),
      afterLineStyle: LineStyle(color: isDeliveryStep ? Colors.blue : Colors.green),
      startChild: Padding(
        padding:const EdgeInsets.only(left: 5.0),
        child: Text(
          date,
          style:const TextStyle(fontSize: 14),
        ),
      ),
    );
  }