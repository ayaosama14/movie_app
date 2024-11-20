import 'package:flutter/material.dart';
import 'package:movie/core/utils/text_container.dart';

import 'package:provider/provider.dart';

import '../../../../utils/di.dart';

import '../../../../utils/buttom_nav_bar.dart';
import '../../../../utils/carousel.dart';
import '../manager/provider/pop_movies_provider.dart';
import '../widgets/one_movie_item.dart';


class HomeView extends StatefulWidget {
  static const String id = "home_view";
  int selectedIndex = 0;

  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider=getIt<PopularMoviesProvider>();
    return ChangeNotifierProvider(
      create: (_) => provider..fetchPopularMovies(1),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Scaffold(
            bottomNavigationBar: bottomNavBar(
              selectedIndex: widget.selectedIndex,
              context: context,
            ),
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.0,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Consumer<PopularMoviesProvider>(
                      builder: (_, provider, __) {
                        // Show a loading indicator while fetching data
                        if (provider.movies == null ||
                            provider.movies!.isEmpty) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (provider.errorMessage != null) {
                          return Center(
                              child: Text('Error: ${provider.errorMessage}'));
                        }
                        return carouselSliderImage(
                            context: context, listOfMovies: provider.movies);
                      },
                    ),
                    SizedBox(
                      height: 5.0,
                      width: MediaQuery.of(context).size.width,
                    ),

                    textContainer(context: context, text:  "Popular_Movies"),
                    SizedBox(
                      height: 1.0,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Consumer<PopularMoviesProvider>(
                      builder: (context, provider, child) {
                        // Show a loading indicator while fetching data
                        if (provider.movies == null ||
                            provider.movies!.isEmpty) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (provider.errorMessage != null) {
                          return Center(
                              child: Text('Error: ${provider.errorMessage}'));
                        }
                        return MovieItem(provider.movies,provider);
                      },
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
