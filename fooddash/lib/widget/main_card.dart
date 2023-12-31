import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class CardCarousel extends StatelessWidget {
  final List<String> cardAssetPaths = [
  "image/Banner1.jpeg",
  "image/banner4.jpg",
  "image/banner6.jpg",   
  
  ];
 CardCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: SizedBox(
          height: 200, 
          child: InkWell(
            onTap: (){},
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
          
                viewportFraction: 0.8, 
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval:const  Duration(seconds: 3), 
                autoPlayAnimationDuration:const  Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                aspectRatio: 2.0, 
                onPageChanged: (index, reason) {
                },
              ),
            ),
          ),
        ),
      );
  }
}
