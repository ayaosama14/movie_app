import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:movie/core/featchers/home_fetcher/data/repo_imp/pop_movie_repo_imp.dart';

import '../../../../../utils/di.dart';
import '../../../data/Models/pop_movie_model.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitialState());

  RepoImp gitRepoImp = getIt.get<RepoImp>();
  int ? pageNum =1;
  List<Results> ? movies=[];

  Future<void> fetchPopMovies(int page) async {
    emit(MoviesLoadingState());

    Either<String, PopularResModel> result = await gitRepoImp.fetchPopularMovies(page: page);

    result.fold(
          (error) {
        emit(MoviesFailedState(errorMassage: error)); // Emit error state
      },
          (instanceModel) {
            movies?.addAll(instanceModel.results as Iterable<Results>);
            pageNum=instanceModel.page!;
        emit(MoviesSuccessState( movies: movies,page:  pageNum )); // Emit success state with fetched movies
      },
    );
  }
}
