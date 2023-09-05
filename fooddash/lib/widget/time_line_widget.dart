import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

Widget buildTimelineTile() {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      indicatorStyle: IndicatorStyle(
        width: 20,
        color:  Colors.green,
        iconStyle: IconStyle(
          color: Colors.white,
         iconData: Icons.circle
        ),
      ),
     
    );
  }