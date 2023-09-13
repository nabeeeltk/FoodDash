import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddash/model/time_lilne_model.dart';
import 'package:get/get.dart';

class TimelineController extends GetxController {
  final RxList<TimelineItem> timelineItems = <TimelineItem>[].obs;
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  void addTimelineItem() async {
    final newItem = TimelineItem(
      title: title.text, 
      // Use the value from the title controller
      description:
          description.text,
       // Use the value from the description controller
      dateTime: DateTime.now(),
    );

    try {
      await FirebaseFirestore.instance.collection('timeline').add({
        'title': newItem.title,
        'description': newItem.description,
        'dateTime': newItem.dateTime,
      });

    
    
      title.clear();
      description.clear();
      Get.back();
    } catch (e) {
      log('Error adding timeline item: $e');
    }
  }

  Future<void> fetchTimelineItems() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('timeline')
          .orderBy('dateTime', descending: true)
          .get();

      final items = snapshot.docs
          .map((doc) => TimelineItem(
                title: doc['title'],
                description: doc['description'],
                dateTime: (doc['dateTime'] as Timestamp).toDate(),
              ))
          .toList();

      timelineItems.assignAll(items);
      log(title.toString());
    } catch (e) {
      log('Error fetching timeline items: $e');
    }
  }
}
