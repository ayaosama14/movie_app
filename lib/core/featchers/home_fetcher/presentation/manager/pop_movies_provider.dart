import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';


import '../../data/Models/pop_movie_model.dart';
import '../../data/repo_imp/pop_movie_repo_imp.dart';

class PopularMoviesProvider with ChangeNotifier {
  List<Results> ? movies  = [];
  bool isLoading = false;
  String? errorMessage;



  Future fetchPopularMovies() async{
    isLoading = true;
    // Fetch popular movies data from an API or other source
   Either<String, PopularResModel> result  =await RepoImp().fetchPopularMovies();

   result.fold(
         (error) {

      errorMessage = error;
       // // print('Error: $error');
       isLoading = false;
       notifyListeners();
         },
         (instanceOfModel) {

       movies = instanceOfModel.results?? [];
       // print('* provider instanceOfModel.results: $movies');
       isLoading = false;
       notifyListeners();
     },
   );
 }
}
