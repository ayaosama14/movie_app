import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_style.dart';
import 'package:provider/provider.dart';

import '../../../../utils/const.dart';
import '../../../../utils/spacer.dart';
import '../../data/model.dart';
import '../manager/popular_movies_provider.dart';

class DetailsMovieView extends StatefulWidget{
  static const  id='details_movie_view';
  // late final List<Results>? movies;
late int  ? index;
  DetailsMovieView({this.index});

  @override
  State<DetailsMovieView> createState() => _DetailsMovieViewState();
}

class _DetailsMovieViewState extends State<DetailsMovieView> {
  @override
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
      child:   Consumer<PopularMoviesProvider>(
        builder: (context, provider, child) {
      // Show a loading indicator while fetching data
      if (provider.movies == null || provider.movies!.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      } if (provider.errorMessage != null) {
        return Center(child: Text('Error: ${provider.errorMessage}'));
      }
      return
        Scaffold(
          appBar: AppBar(
              title:  Text( (provider.movies![widget.index!].title!),style: AppStyle.boldBlackTextStyle,),
              centerTitle:true,
              leading:IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon:Icon(Icons.arrow_back_ios_rounded ),),
            ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Column
              (crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                spacerH4,
                CachedNetworkImage(

                  imageUrl: (ConstValues.baseImage+ provider.movies![widget.index!].posterPath!),
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height:  MediaQuery.of(context).size.height*0.35,
                )
                ,


                    spacerH4,
                Container(
                  padding: const EdgeInsets.all(6),
                  margin: const EdgeInsets.all(4),
                  // width:MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(6.0),),),
                  child:   Text(
                  ('Movie name: '+provider.movies![widget.index!].title!),
                    style: AppStyle.boldBlackTextStyle,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                  ),
                ),

              spacerH8,
              Text('Date: '+provider.movies![widget.index!].releaseDate! ,style: AppStyle.boldBlackTextStyle,textAlign: TextAlign.left,),
                spacerH8,  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CachedNetworkImage(

                    imageUrl: (ConstValues.baseImage+provider.movies![widget.index!].posterPath!),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width*0.25,
                    height:  140,
                  )
                  ,

                spacerW10,
                SizedBox(
                  width:  MediaQuery.of(context).size.width*0.70,
                  child: Text("Over view : "+provider.movies![1].overview!, style: AppStyle.boldTextStyle14,maxLines: 6,
                      overflow :TextOverflow.ellipsis),
                )

              ],)


            ],),
          ),
        );
        })

    );
  }
}

