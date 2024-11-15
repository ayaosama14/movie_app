// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import '../../../../utils/const.dart';
import '../../../../utils/spacer.dart';

import '../../data/Models/pop_movie_model.dart';


class DetailsMovieView extends StatelessWidget {
  static const id = 'details_movie_view';
  final List<Results>? movies;

  DetailsMovieView({super.key, this.index, this.movies});

  late int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (movies![index!].title!),
          // style: AppStyle.boldBlackTextStyle20,
        ),
        // centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spacerH4,
            CachedNetworkImage(
              imageUrl: (ConstValues.baseImage + movies![index!].posterPath!),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            spacerH4,
            spacerH8,
            Text(
              'Date: ${movies![index!].releaseDate!}',
              // style: AppStyle.boldBlackTextStyle20,
              style: Theme.of(context).textTheme.bodyMedium
              // textAlign: TextAlign.left,
            ),
            spacerH8,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      (ConstValues.baseImage + movies![index!].posterPath!),
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 180,
                ),
                spacerW12,
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.69,
                      child: Text("Over view:  ${movies![index!].overview!}",
                          style: Theme.of(context).textTheme.bodySmall

                          ,maxLines: 6,
                          overflow: TextOverflow.ellipsis),
                    ),
                    spacerH8,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.69,
                      child: Text(
                          "Language: ${movies![index!].originalLanguage!}",
                          style: Theme.of(context).textTheme.bodySmall,

                          maxLines: 6,
                          overflow: TextOverflow.ellipsis),
                    ),
                    spacerH8,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.69,
                      child: Text("popularity: ${((movies![index!].popularity!/100).toStringAsFixed(1))}%",
                          // style: AppStyle.textStyle14,
                          style: Theme.of(context).textTheme.bodySmall
                         , maxLines: 6,
                          overflow: TextOverflow.ellipsis),
                    ),

                    spacerH8,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.69,
                      child: Row(
                        children: [
                          Text("vote: ${movies![index!].voteAverage!.toStringAsFixed(1)}",
                              // style: AppStyle.textStyle14,
                              style: Theme.of(context).textTheme.bodySmall
                            ,  maxLines: 6,
                              overflow: TextOverflow.ellipsis),
                      const    Icon(Icons.star_border_outlined,color: Colors.amber,)
                        ],
                      )
                    ),
                  ],
                ),
                // originalLanguage
              ],
            )
          ],
        ),
      ),
    );
  }
}
