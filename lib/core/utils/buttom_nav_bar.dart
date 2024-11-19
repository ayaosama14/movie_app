import 'package:flutter/material.dart';
import '../featchers/home_fetcher/presentation/views/setting.dart';
import 'app_colors.dart';
import '../featchers/home_fetcher/presentation/views/home_view.dart';

BottomNavigationBar bottomNavBar(
    {required int selectedIndex, required BuildContext context}) {
  return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline_outlined),
          label: 'Wish list',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.archive_outlined),
          label: 'Archive',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Setting',
        ),
      ],
      currentIndex: selectedIndex ?? 0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (selectedIndex) {
        switch (selectedIndex) {
          case 0:
            Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeView())  );
            break;
          case 3:
            Navigator.pushNamed(context, SettingView.id );
            break;
        }
      });
}
