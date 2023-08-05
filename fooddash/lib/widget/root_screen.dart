import 'package:flutter/material.dart';
import 'package:fooddash/view/shop_owner/add_new_item.dart';
import 'package:fooddash/view/shop_owner/home_screen.dart';
import 'package:fooddash/view/shop_owner/owner_profile.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
   const  ShopeHomeScreen(),
     Container(), 
    const  AddNewItem(),
   const OwnerProfil()
     ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
       selectedItemColor: Colors.orange.shade800,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
             backgroundColor: Colors.blueGrey,
            icon: Icon(Icons.home,size: 30,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
             backgroundColor: Colors.blueGrey,
            icon: Icon(Icons.list,size: 30),
            label: 'Search',
          ),
           BottomNavigationBarItem(
             backgroundColor: Colors.blueGrey,
            icon: Icon(Icons.add,size: 30),
            label: 'Add Prodect',
          ),
          
          BottomNavigationBarItem(
             backgroundColor: Colors.blueGrey,
            icon: Icon(Icons.person,size: 30),
            label: 'Profile',
          ),

        ],
      ),
      
    );
  }
}
