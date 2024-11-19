import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import '../../../../utils/const.dart';

import '../../data/Models/pop_movie_model.dart';
import '../../data/pagination.dart';
import '../manager/pop_movies_provider.dart';
import '../views/details_view.dart';

class MovieItem extends StatefulWidget {
  final List<Results>? movies;
  PopularMoviesProvider? provider;

  MovieItem(this.movies, this.provider, {super.key});

  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels ==
                  notification.metrics.maxScrollExtent &&
              notification is ScrollUpdateNotification) {
            //get next page
           
            // print('loadMoreMovies');
            // print("PaginationData().page! ${widget.provider!.page! }");
          int  nextPage = (widget.provider!.page! + 1) ;
            widget.provider!.fetchPopularMovies(nextPage);
          }
          return true;
        },
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 6.0),
          itemCount: widget.movies!.length ?? 0,
          itemBuilder: (context, index) {
            final movie = widget.movies![index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsMovieView(
                          index: index, movies: widget.movies!)),
                );
                // Navigator.push(context,DetailsMovieView(index: index) as Route<Object?> );
                // Navigator.pushNamed(context, DetailsMovieView.id, arguments:index);
              },
              child: Container(
                height: 380,
                width: 200,
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CachedNetworkImage(
                      imageUrl: (AppConst.baseImage + movie.posterPath!),
                      fit: BoxFit.cover,
                      width: 200.0,
                      height: 250.0,
                    ),
                    const SizedBox(height: 8.0),
                    Expanded(
                      flex: 2,
                      child: Text(
                        ' ${movie.title!}',
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Expanded(
                      child: Text(
                          ' popularity  : ${((movie.popularity! / 100).toStringAsFixed(1))}%',
                          // style: AppStyle.thinColorTextStyle16,
                          style: Theme.of(context).textTheme.displayMedium),
                    ),
                    const SizedBox(height: 8.0),
                    Expanded(
                      child: Text(' release Date : ${movie.releaseDate}',
                          style: Theme.of(context).textTheme.displayMedium
                          // style: AppStyle.thinColorTextStyle16,
                          ),
                    ),
                    const SizedBox(height: 4.0),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
