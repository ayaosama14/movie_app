import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_style.dart';
import 'package:provider/provider.dart';

import '../../../../utils/spacer.dart';
import '../../data/model.dart';
import '../manager/popular_movies_provider.dart';

class DetailsMovieView extends StatefulWidget{
  static const  id='details_movie_view';
  final List<Results>? movies;
   DetailsMovieView({super.key,  this.movies});

  @override
  State<DetailsMovieView> createState() => _DetailsMovieViewState();
}

class _DetailsMovieViewState extends State<DetailsMovieView> {@override
void initState() {
  super.initState();
  // You can call fetchPopularMovies here if you have a provider available
  Future.microtask(() {
    final myprovider = Provider.of<PopularMoviesProvider>(context, listen: false);
    myprovider.fetchPopularMovies();
  });
}
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
              Consumer<PopularMoviesProvider>(
                builder: (context, provider, child) {
                  // Show a loading indicator while fetching data
                  if (provider.movies == null || provider.movies!.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } if (provider.errorMessage != null) {
                    return Center(child: Text('Error: ${provider.errorMessage}'));
                  }
                  return
                 Container(
          width: MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height*0.35,
            decoration:  BoxDecoration(
              color: Colors.indigo,



              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                   widget.movies![1].posterPath!
                    // item.posterPath!
                ),
              ),

            ));

                  },
    ),
                  spacerH8,
            Text('  '+ widget.movies![1].title! ,style: AppStyle.boldBlackTextStyle,textAlign: TextAlign.left,),
            spacerH8,
            Text('  '+ widget.movies![1].releaseDate! ,style: AppStyle.boldBlackTextStyle,textAlign: TextAlign.left,),
              spacerH8,  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [  Container(
                width: MediaQuery.of(context).size.width*0.25,
                height:  140,

                decoration:  BoxDecoration(
                  color: Color(0xff7c94b6),



                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        widget.movies![1].posterPath!
                      // item.posterPath!
                    ),
                  ),

                ),
            )
              ,spacerW10,
              SizedBox(
                width:  MediaQuery.of(context).size.width*0.70,
                child: Text( widget.movies![1].overview!, style: AppStyle.boldTextStyle14,maxLines: 6,
                    overflow :TextOverflow.ellipsis),
              )

            ],)


          ],),
        ),
      ),
    );
  }
}

