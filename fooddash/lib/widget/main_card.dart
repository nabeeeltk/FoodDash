// import 'package:carousel_slider/carousel_options.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// class CardItem {
//   final String title;
//   final String description;
//   final String imageUrl;

//   CardItem({required this.title, required this.description, required this.imageUrl});
// }

// final List<CardItem> cardItems = [
//   CardItem(
//     title: "Item 1",
//     description: "Description of Item 1",
//     imageUrl: "image/Resturent1.jpg",
//   ),
//   CardItem(
//     title: "Item 2",
//     description: "Description of Item 2",
//     imageUrl: "image/Resturent1.jpg",
//   ),
//   // Add more items as needed
// ];
// class CardCarousel extends StatefulWidget {
//    CardCarousel({super.key});

//   @override
//   State<CardCarousel> createState() => _CardCarouselState();
// }


// class _CardCarouselState extends State<CardCarousel> {
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider.builder(
//       itemCount: cardItems.length,
//       itemBuilder: (BuildContext context, int index, int realIndex) {
//         final item = cardItems[index];
//         return Card(
//           // You can design the card as per your requirement
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//                       Container(
//                         height: 100,
//                         width: double.infinity,
//                         de
//                       ),
//                       // Use Image.asset for asset images
//               SizedBox(height: 10),
//               Text(item.title),
//               Text(item.description),
//             ],
//           ),
//         );
//       },
//       options: CarouselOptions(
//         // Customize carousel options as needed
//         height: 300,
//         viewportFraction: 0.8,
//         initialPage: 0,
//         enableInfiniteScroll: true,
//         reverse: false,
//         autoPlay: true,
//         autoPlayInterval: Duration(seconds: 3),
//         autoPlayAnimationDuration: Duration(milliseconds: 800),
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enlargeCenterPage: true,
//         onPageChanged: (index, reason) {
//           // Optional: Implement logic for handling page change events
//         },
//       ),
//     );
//   }
// }
