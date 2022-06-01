import 'package:flutter/material.dart';
import 'package:project/data/fake.dart';
import 'package:project/screens/category/category_screen.dart';
import 'package:project/screens/home/widgets/header.dart';
import 'package:project/screens/home/widgets/section.dart';
import 'package:project/widgets/app_bottom_navigation.dart';
import 'widgets/category_card.dart';
import 'widgets/image_card.dart';
import 'widgets/promo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  onCategorySelected(category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigation(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              /*Section(
                'Categories',
                Fake.categories.map((c) {
                  return CategoryCard(
                    title: c.title,
                    iconPath: c.iconPath,
                    onTap: () {
                      onCategorySelected(c);
                    },
                  );
                }).toList(), key: 
                
              ),
              Section(
                'Today\'s Promo',
                Fake.promotions.map((p) {
                  return PromoCard(
                    title: p.title,
                    subtitle: p.subtitle,
                    tag: p.tag,
                    caption: p.caption,
                    imagePath: p.imagePath,
                    backgroundImagePath: p.backgroundImagePath,
                    
                    reverseGradient: null, key: null,
                  );
                }).toList(), key: null,
                
              ),
              */
            ],
          ),
        ),
      ),
    );
  }
}
