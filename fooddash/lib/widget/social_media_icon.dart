import 'package:flutter/material.dart';

class SocialMediaIcon extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap; 

  const SocialMediaIcon({required this.imagePath, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}
