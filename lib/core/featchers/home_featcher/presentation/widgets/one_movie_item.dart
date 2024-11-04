
import 'package:flutter/material.dart';
import 'package:movie/core/featchers/home_featcher/data/model.dart';

import '../../../../utils/app_style.dart';

class MovieItem extends StatefulWidget {
  final List<Results>? movies;


  const MovieItem(this.movies, {super.key});

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: 240,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,

          separatorBuilder: (context, index) => const SizedBox(width: 6.0),
          itemCount: widget.movies!.length  ?? 0,
          itemBuilder: (context, index) {
            final movie = widget.movies![index];
            return Container(
              height: 200,
              margin: const EdgeInsets.only(left: 8, right: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6.0),),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 180.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(6.0)),


                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          movie.posterPath!,
                        ),
                      ),

                    ),
                    // color: Colors.black,

                    // color: Colors.black12,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    movie.title!,
                    style: AppStyle.boldTextStyle14,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '${movie.popularity!} • ${movie.releaseDate!}',
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
