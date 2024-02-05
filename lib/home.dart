import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:travelapp/page/bottomnav/account.dart';
import 'package:travelapp/page/bottomnav/bookmark.dart';
import 'package:travelapp/page/bottomnav/favoritepage.dart';
import 'package:travelapp/page/bottomnav/homepage.dart';
import 'package:travelapp/state/bottomnavbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavBarController = Get.put(BottomNavBarController());
    final List<Widget> page = [
      const HomePage(),
      const FavoritePage(),
      const BookMarkPage(),
      const AccountPage()
    ];
    return GetBuilder<BottomNavBarController>(
      builder: (_)=>Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            bottomNavBarController.onChangeCurrentIndex(value);
          },
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          currentIndex: bottomNavBarController.current,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const[
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home),
              label: 'home'
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.favorite),
              icon: Icon(Icons.favorite),
              label: 'favorite'
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.bookmark),
              icon: Icon(Icons.bookmark),
              label: 'bookmark'
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person),
              icon: Icon(Icons.person),
              label: 'account'
            )
          ]
        ),
        body: page[bottomNavBarController.current]
      )
    );
  }
}