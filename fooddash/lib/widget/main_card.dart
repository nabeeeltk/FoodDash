import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CardCarousel extends StatelessWidget {
  final List<String> cardAssetPaths = [
    "image/Resturent1.jpg",
  "image/Resturent1.jpg",
  "image/Resturent1.jpg",    // Add more asset paths here
  ];

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: SizedBox(
          height: 200, // Adjust the height according to your preference
          child: CarouselSlider.builder(
            itemCount: cardAssetPaths.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    cardAssetPaths[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              viewportFraction: 0.8, // Adjust the card width
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3), // Adjust the auto-play interval
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              aspectRatio: 2.0, // Adjust the aspect ratio of the carousel
              onPageChanged: (index, reason) {
                // Handle page change event if needed
              },
            ),
          ),
        ),
      );
  }
}
