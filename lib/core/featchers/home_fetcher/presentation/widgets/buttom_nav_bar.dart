
import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';
import '../views/home_view.dart';

BottomNavigationBar bottomNavBar ({required int selectedIndex,required BuildContext context}){
  return BottomNavigationBar(
      elevation: 8,
      unselectedItemColor:Colors.black,
      unselectedFontSize:15,
      selectedFontSize: 18,

     items: const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
  icon: Icon(Icons.home),
  label: 'Home',
  ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_circle_outline_outlined),
      label: 'Wish list',
    ),BottomNavigationBarItem(
      icon: Icon(Icons.archive_outlined),
      label: 'Archive',
    ),BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Setting',
    ),]
    ,
    currentIndex: selectedIndex??0,
      // backgroundColor:Colors.black54,
      iconSize:28,
      selectedItemColor: AppColor.pr1Color,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap:( selectedIndex){
        switch(selectedIndex){
        case 0:
        Navigator.pushNamed(context,  HomeView.id);
        break;

        }
      }
  );
}