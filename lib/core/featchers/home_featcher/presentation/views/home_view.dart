import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_style.dart';

import '../widgets/one_movie_item.dart';

class HomeView extends StatelessWidget {
  static const String id = "home_view";

  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
            
            
              children:  [
            
                const SizedBox(height: 8.0),
                const  Text(' Popular Movies',style:AppStyle.boldBlackTextStyle,textAlign: TextAlign.left
                    ,),
                const SizedBox(height: 8.0),
               MovieGridScreen(),
                const SizedBox(height: 8.0),
                    MovieGridScreen(),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
