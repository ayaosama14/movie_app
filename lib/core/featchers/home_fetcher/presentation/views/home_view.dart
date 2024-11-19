import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_style.dart';
import 'package:provider/provider.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/di.dart';
import '../manager/cubit/movies_cubit.dart';
import '../manager/provider/pop_movies_provider.dart';
import '../../../../utils/buttom_nav_bar.dart';
import '../../../../utils/carousel.dart';
import '../widgets/one_movie_item.dart';
import 'details_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  static const String id = "home_view";
  int selectedIndex = 0;

  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late MoviesCubit _moviesCubit;

  void onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _moviesCubit = MoviesCubit(); // Initialize the cubit
    _moviesCubit.fetchPopMovies(1); // Fetch popular movies for the first page
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesCubit>(
        create: (context) => _moviesCubit,
        child: BlocBuilder<MoviesCubit, MoviesState>(
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                              ),
                              /////////////////////////////////////////////
                              if (state is MoviesLoadingState)
                          const Center(child: CircularProgressIndicator()),
                  if (state is MoviesFailedState)
              Center(child: Text('Error: ${state.errorMassage}'))
              ,
              if (state is MoviesSuccessState)
              carouselSliderImage( context: context,listOfMovies: state.movies),


              ////////////////////////////////////////////////////////////
              SizedBox(
              height: 5.0,
              width: MediaQuery.of(context).size.width,
              ),
              Container(
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.all(10),
              width:MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.all(
              Radius.circular(6.0),
              ),
              ),
              child: Text(
              'Popular_Movies'.tr(),
              // style: AppStyle.boldBlackTextStyle20,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.start,
              maxLines: 1,
              ),
              ),
              SizedBox(
              height: 1.0,
              width: MediaQuery.of(context).size.width,
              ),
              ///////////////////////////////////
              if (state is MoviesLoadingState)
              const Center(child: CircularProgressIndicator()),
              if (state is MoviesFailedState)
              Center(child: Text('Error: ${state.errorMassage}')),
              if (state is MoviesSuccessState)
              MovieItem(state.movies ,_moviesCubit),
                                ],
                              ),
                          ),
                      ),
                  ),
              );
            },
        ),
    );
  }
}