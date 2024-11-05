
// Consumer<PopularMoviesProvider>(
//   builder: (context, provider, child) {
//     // Show a loading indicator while fetching data
//     if (provider.movies == null || provider.movies!.isEmpty) {
//       return const Center(child: CircularProgressIndicator());
//     } if (provider.errorMessage != null) {
//     return Center(child: Text('Error: ${provider.errorMessage}'));
//   }
//     return  MovieItem(provider.movies);
//   },
//
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../data/model.dart';
 CarouselSlider CarouselSliderImage({required BuildContext context ,required List<Results> ? listofMovies}){
  return CarouselSlider(
options: CarouselOptions(height:  MediaQuery.of(context).size.height*0.35,


aspectRatio: 16/9,
viewportFraction: 0.8,
initialPage: 0,
enableInfiniteScroll: true,
reverse: false,
autoPlay: true,
autoPlayInterval: const Duration(seconds: 3),
autoPlayAnimationDuration:const Duration(milliseconds: 600),
autoPlayCurve: Curves.fastOutSlowIn,
enlargeCenterPage: true,
enlargeFactor: 0.3,

scrollDirection: Axis.horizontal,
),
items:listofMovies?.map((item) {
return Builder(
builder: (BuildContext context) {
return Container(
width: MediaQuery.of(context).size.width,
height:  MediaQuery.of(context).size.height*35,
decoration: BoxDecoration(
color: const Color(0xff7c94b6),



    image: DecorationImage(
    fit: BoxFit.cover,
    image: NetworkImage(
  item.posterPath!
    ),
    ),

));
},
);
}).toList(),
);}