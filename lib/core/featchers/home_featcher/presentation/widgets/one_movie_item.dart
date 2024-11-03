
import 'package:flutter/material.dart';

import '../../../../utils/app_style.dart';

class MovieGridScreen extends StatelessWidget {
  final List<Map<String, dynamic>> movies = [
    {
      'title': 'Venom: The Last Dance',
      'image': 'https://via.placeholder.com/150',
      'rating': '67%',
      'releaseDate': 'Oct 24, 2024',
    }, {
      'title': 'Venom: The Last Dance',
      'image': 'https://via.placeholder.com/150',
      'rating': '67%',
      'releaseDate': 'Oct 24, 2024',
    }, {
'title': 'Venom: The Last Dance',
'image': 'https://via.placeholder.com/150',
'rating': '67%',
'releaseDate': 'Oct 24, 2024',
},{
      'title': 'Venom: The Last Dance',
      'image': 'https://via.placeholder.com/150',
      'rating': '67%',
      'releaseDate': 'Oct 24, 2024',
    }, {
      'title': 'Venom: The Last Dance',
      'image': 'https://via.placeholder.com/150',
      'rating': '67%',
      'releaseDate': 'Oct 24, 2024',
    }
    // Add more movie data as needed
  ];



  @override
  Widget build(BuildContext context) {

    return
      SizedBox(
        height:180,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,

          separatorBuilder: (context, index) => const SizedBox(width: 6.0),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Container(

                  margin:const EdgeInsets.only(left: 8,right: 8),
                decoration: const BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.all( Radius.circular(6.0)),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 180.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          borderRadius:const BorderRadius.all( Radius.circular(6.0)),


                           image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            movie['image'],
                          ),
                        ),

                        ),
                        // color: Colors.black,

                        // color: Colors.black12,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        movie['title'],
                        style: AppStyle.boldTextStyle14,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        '${movie['rating']} • ${movie['releaseDate']}',
                        style: AppStyle.greyTextStyle12,
                      ),
                    ],
                  ),
                );
              },

        ),
      );
  }
}

