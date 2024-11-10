
import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_style.dart';
import 'package:provider/provider.dart';
import '../manager/pop_movies_provider.dart';
import '../widgets/buttom_nav_bar.dart';
import '../widgets/carousel.dart';
import '../widgets/one_movie_item.dart';
import 'details_view.dart';


class HomeView extends StatefulWidget {
  static const String id = "home_view";
int selectedIndex=0;
   HomeView({super.key});

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
  void onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(create: (_) => PopularMoviesProvider(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Scaffold(
            bottomNavigationBar:bottomNavBar(selectedIndex:   widget.selectedIndex,
              context: context ,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.0,width:MediaQuery.of(context).size.width,),
              Consumer<PopularMoviesProvider>(
                builder: (_, provider, __) {
                  // Show a loading indicator while fetching data
                  if (provider.movies == null || provider.movies!.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } if (provider.errorMessage != null) {
                    return Center(child: Text('Error: ${provider.errorMessage}'));
                  }
                  return  CarouselSliderImage(context: context,listOfMovies: provider.movies);
                },
              ),

               SizedBox(height: 4.0,width:MediaQuery.of(context).size.width,),
                  Container(
                    padding: const EdgeInsets.all(6),
                    margin: const EdgeInsets.all(4),
                    // width:MediaQuery.of(context).size.width,
                     decoration: const BoxDecoration(
                       color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(6.0)),),
                    child:  const Text(
                      'Popular Movies:',
                      style: AppStyle.boldBlackTextStyle20,
                       textAlign: TextAlign.start,
                      maxLines: 1,
                      ),
                  ),
                  SizedBox(height: 4.0,width:MediaQuery.of(context).size.width,),


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
                ]),
              ),
            ),
          ),
      ),
    );
  }
}
