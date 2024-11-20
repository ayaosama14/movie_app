import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:movie/core/featchers/home_fetcher/data/repo_imp/pop_movie_repo_imp.dart';

import '../../../../../utils/di.dart';
import '../../../data/Models/pop_movie_model.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final RepoImp gitRepoImp = getIt.get<RepoImp>();
  int? pageNum = 1;
  List<Results>? movies = [];

  MoviesBloc() : super(MoviesInitial()) {

    on<FetchMoviesEvent>((event, emit) async {
      emit(MoviesLoadingState());

      Either<String, PopularResModel> result =
      await gitRepoImp.fetchPopularMovies(page: event.pageNum);

      result.fold(
            (error) {
          emit(MoviesFailedState(errorMessage: error));
        },
            (instanceModel) {
          movies?.addAll(instanceModel.results as Iterable<Results>);
          pageNum = instanceModel.page!;
          emit(MoviesSuccessState(movies: movies, page: pageNum));
        },
      );
    });
  }
}
