import 'package:flutter/material.dart';

class UserReview extends StatelessWidget {
  const UserReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(itemBuilder: (context, index) {
        return ListTile(
          title: Text("review"),
          subtitle: Text("rating"),
        );
      }, separatorBuilder: (context, index) {
      return  Divider();
      }, itemCount: 3),
    );
  }
}