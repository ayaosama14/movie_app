import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/text_container.dart';

import '../../../../utils/buttom_nav_bar.dart';
import '../../../../utils/carousel.dart';
import '../manager/bloc/movies_bloc.dart';

import '../widgets/one_movie_item.dart';

class HomeView extends StatefulWidget {
  static const String id = "home_view";
  int selectedIndex = 0;

  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late MoviesBloc _moviesBloc;

  void onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesBloc>(
      create: (context) => MoviesBloc()..add(FetchMoviesEvent(pageNum: 1)),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return SafeArea(
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
                        //////////////////////////////////////////////////////
                        if (state is MoviesLoadingState)
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        if (state is MoviesFailedState)
                          Center(child: Text('Error: ${state.errorMessage}')),
                        if (state is MoviesSuccessState)
                          carouselSliderImage(
                              context: context, listOfMovies: state.movies),

                        ///////////////////////////////////////////////////////////////
                        SizedBox(
                          height: 5.0,
                          width: MediaQuery.of(context).size.width,
                        ),

                        textContainer(context: context, text: "Popular_Movies"),
                        SizedBox(
                          height: 1.0,
                          width: MediaQuery.of(context).size.width,
                        ),
                        //////////////////////////////////////////////////////////////
                        if (state is MoviesLoadingState)
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        if (state is MoviesFailedState)
                          Center(child: Text('Error: ${state.errorMessage}')),
                        if (state is MoviesSuccessState)
                          MovieItem(state.movies,
                              BlocProvider.of<MoviesBloc>(context)),
                        //////////////////////////////////////////////////////////////////
                      ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
