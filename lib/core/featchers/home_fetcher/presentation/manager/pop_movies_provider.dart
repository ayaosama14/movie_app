import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/featchers/home_fetcher/data/pagination.dart';

import '../../../../utils/di.dart';
import '../../data/Models/pop_movie_model.dart';
import '../../data/repo_imp/pop_movie_repo_imp.dart';

class PopularMoviesProvider with ChangeNotifier {
  List<Results>? movies = [];
  int ?page;
  bool isLoading = false;
  String? errorMessage;


  RepoImp objRepoImp = getIt.get<RepoImp>();




  // PopularResModel instanceOfModel= getIt.get<PopularResModel>();
  Future fetchPopularMovies(int pageNum) async {
    isLoading = true;
    // Fetch popular movies data from an API or other source
    Either<String, PopularResModel> result = await objRepoImp
        .fetchPopularMovies(page: pageNum);

    result.fold(
          (error) {
        errorMessage = error;
        // // print('Error: $error');
        isLoading = false;
        notifyListeners();
      },
          (data) {
        movies?.addAll(data.results as Iterable<Results>);
        page=data.page;
        // print('* provider instanceOfModel.results: $movies');
        isLoading = false;
        notifyListeners();
      },
    );
  }



  // Future loadMoreMovies() async {
  //   int nextPage ;
  //    bool hasNextPage () {
  //     return (PaginationData().page!) < (PaginationData().totalPages!) ? true : false;
  //   }
  //
  //
  //
  //   if (hasNextPage()==true) {
  //     print('PopularResModel().hasNextPage');
  //     nextPage = (PaginationData().page! + 1) ?? 1;
  //     print('nextPage${nextPage}');
  //     return await fetchPopularMovies(nextPage);
  //   }
  //


  // }
}
