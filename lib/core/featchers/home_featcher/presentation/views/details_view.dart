import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_style.dart';

import '../../../../utils/spacer.dart';

class DetailsMovieView extends StatelessWidget{
  static const  id='details_movie_view';

  const DetailsMovieView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('movie Name ',style: AppStyle.boldBlackTextStyle,),centerTitle:true),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: Column
            (crossAxisAlignment: CrossAxisAlignment.start,

            children: [
          Container(
          width: MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height*0.35,
            decoration: const BoxDecoration(
              color: Colors.amber,



              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'url'
                    // item.posterPath!
                ),
              ),

            )),spacerH8,
            Text('  '+' movie name' ,style: AppStyle.boldBlackTextStyle,textAlign: TextAlign.left,),
            spacerH8,
            Text('  '+'movie date' ,style: AppStyle.boldBlackTextStyle,textAlign: TextAlign.left,),
              spacerH8,  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [  Container(
                width: MediaQuery.of(context).size.width*0.25,
                height:  140,

                decoration: const BoxDecoration(
                  color: Color(0xff7c94b6),



                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'url'
                      // item.posterPath!
                    ),
                  ),

                ),
            )
              ,spacerW10,
              SizedBox(
                width:  MediaQuery.of(context).size.width*0.70,
                child: Text('bs about moviesall details ut moviesall ovies bs about moviesall details ut moviesall oviesbs about moviesall details ut moviesall ovies',
                  style: AppStyle.boldTextStyle14,maxLines: 6,
                    overflow :TextOverflow.ellipsis),
              )

            ],)


          ],),
        ),
      ),
    );
  }
}

