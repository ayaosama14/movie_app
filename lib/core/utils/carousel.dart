import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


import 'const.dart';
import '../featchers/home_fetcher/data/Models/pop_movie_model.dart';

 CarouselSlider carouselSliderImage({required BuildContext context ,required List<Results> ? listOfMovies}){
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
items:listOfMovies?.map((item) {
return Builder(
builder: (BuildContext context) {
return


    CachedNetworkImage(

     imageUrl: (AppConst.baseImage+item.posterPath!),
      fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height:  MediaQuery.of(context).size.height*45,
 );


},
);
}).toList(),
);}