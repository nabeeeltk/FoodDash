import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

Widget buildTimelineTile() {
    return TimelineTile(
  alignment: TimelineAlign.manual, // This property is typically used
  lineXY: 0.1, // Adjust this value as needed
  isFirst: true,
  indicatorStyle: IndicatorStyle(
    color: Colors.blue, // Customize the color
    indicatorXY: 0.2, // Adjust the vertical position
    padding: EdgeInsets.all(8.0), // Add padding
    iconStyle: IconStyle(
      iconData: Icons.check, // Customize the icon
      color: Colors.white, // Customize the icon color
    ),
  ),
  // Other timeline tile properties
);

  }