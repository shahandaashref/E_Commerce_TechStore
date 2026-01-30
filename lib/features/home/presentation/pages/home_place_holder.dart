import 'package:e_commerce/features/cart/presentation/pages/cart_page.dart';
import 'package:e_commerce/features/home/presentation/pages/home_page.dart';
import 'package:e_commerce/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';

class HomePlaceHolder extends StatefulWidget {
  const HomePlaceHolder({super.key});

  @override
  State<HomePlaceHolder> createState() => _HomePlaceHolderState();
}

class _HomePlaceHolderState extends State<HomePlaceHolder> {
  int _initPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _pages = [
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _initPage,
        onTap: (index) {
          setState(() {
            _initPage = index;
            _pageController.jumpToPage(index);
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
