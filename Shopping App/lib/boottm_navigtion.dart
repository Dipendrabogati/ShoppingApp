import 'package:flutter/material.dart';
import 'package:untitled6/cart_screen.dart';
import 'package:untitled6/home_screen.dart';
import 'package:untitled6/profile_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<Widget>_screen = [
   const HomeScreen(),
   const CartScreen(),
   const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screen[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (setvalue) {
            setState(() {
              _currentIndex = setvalue;
            });
          },
          items:const  <BottomNavigationBarItem>[
             BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
             BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
             BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
        ),
    );
  }
}
