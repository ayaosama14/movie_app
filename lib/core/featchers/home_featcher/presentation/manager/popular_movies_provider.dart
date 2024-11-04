import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';


import '../../data/model.dart';
import '../../data/repo_imp.dart';

class PopularMoviesProvider extends ChangeNotifier {
  List<Results> ? movies = [];
  bool isLoading = false;
  String? errorMessage;


  Future fetchPopularMovies() async{
    isLoading = true;
    // Fetch popular movies data from an API or other source
   Either<String, PopularResModel> result  =await RepoImp().fetchPopularMovies();

   result.fold(
         (error) {
       // Handle error case
       errorMessage = error;
       print('Error: $error');
       isLoading = false;
       notifyListeners();
         },
         (instanceOfModel) {
       // Handle success case
       movies = instanceOfModel.results?? [];
       print('instanceOfModel.results: $movies');
       isLoading = false;
       notifyListeners();
     },
   );
 }
}
