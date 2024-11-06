
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/featchers/home_featcher/data/model.dart';
import 'package:movie/core/featchers/home_featcher/presentation/views/details_view.dart';

import '../../../../utils/app_style.dart';
import '../../../../utils/const.dart';

class MovieItem extends StatefulWidget {
  final List<Results>? movies;


  const MovieItem(this.movies, {super.key});

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
   return SizedBox(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,


        separatorBuilder: (context, index) => const SizedBox(width: 6.0),
        itemCount:widget.movies!.length ??0,
        itemBuilder: (context, index) {
          final movie = widget.movies![index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsMovieView(index: index)),);
              // Navigator.push(context,DetailsMovieView(index: index) as Route<Object?> );
              // Navigator.pushNamed(context, DetailsMovieView.id, arguments:index);
            }, child: Container(
              height: 380,
              width: 200,
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6.0),),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [



                          CachedNetworkImage(

                            imageUrl: (ConstValues.baseImage+movie.posterPath!),
                            fit: BoxFit.cover,
                            width: 200.0,
                            height: 250.0,
                          )
                    ,




                  const SizedBox(height: 8.0),
                  Expanded( flex: 2,
                    child: Text(
                    ' ${movie.title!}',
                      style: AppStyle.boldBlackTextStyle,
                      maxLines: 2,overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4.0),


                  Expanded(

              child: Text(' popularity  : ${((movie.popularity!/100).toStringAsFixed(1))}%',
                      style: AppStyle.thinColorTextStyle,
                    ),
            ), const SizedBox(height: 8.0),
                  Expanded(
                    child: Text(
                      ' release Date : ${movie.releaseDate}',
                      style: AppStyle.thinColorTextStyle,
                    ),
                  ),
                  const SizedBox(height: 4.0),  ],
              ),
            ),
          );
        },

      ),
    );}}