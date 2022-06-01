import 'package:flutter/material.dart';
import 'package:project/screens/camera/camera_screen.dart';
import 'package:project/screens/category/category_screen.dart';
import 'package:project/screens/home/screen_home.dart';
import 'package:project/screens/profile/profile_screen.dart';
import 'package:project/screens/shop/shop_screen.dart';

class AppBottomNavigation extends StatefulWidget {
  const AppBottomNavigation({Key? key}) : super(key: key);

  @override
  _AppBottomNavigation createState() => _AppBottomNavigation();
}

class _AppBottomNavigation extends State<AppBottomNavigation> {
  int currentIndex = 0;
  final Screens = [
    const ShopScreen(),
    const CategoryScreen(),
    const CameraScreen(),
    const ProfileScreen(),
    const HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.deepPurpleAccent,
            selectedItemColor: Colors.white,
            showUnselectedLabels: false,
            iconSize: 30,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Shopping'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Categorie'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.camera_alt,
                    size: 40,
                  ),
                  label: 'Camera'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            ]),
      );
}
