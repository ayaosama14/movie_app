import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_style.dart';
import 'package:provider/provider.dart';

import '../../data/model.dart';
import '../manager/popular_movies_provider.dart';
import '../widgets/one_movie_item.dart';

class HomeView extends StatefulWidget {
  static const String id = "home_view";

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    // You can call fetchPopularMovies here if you have a provider available
    Future.microtask(() {
      final provider = Provider.of<PopularMoviesProvider>(context, listen: false);
      provider.fetchPopularMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => PopularMoviesProvider(),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 8.0,width:MediaQuery.of(context).size.width,),
                  const Text(
                    'Popular Movies',
                    style: AppStyle.boldBlackTextStyle,
                     textAlign: TextAlign.left,
                    maxLines: 1,
                    ),
                  SizedBox(height: 8.0,width:MediaQuery.of(context).size.width,),
                  Consumer<PopularMoviesProvider>(
                    builder: (context, provider, child) {
                      // Show a loading indicator while fetching data
                      if (provider.movies == null || provider.movies!.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      } if (provider.errorMessage != null) {
                      return Center(child: Text('Error: ${provider.errorMessage}'));
                    }
                      return  MovieItem(provider.movies);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
