part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitialState extends MoviesState {}
final class MoviesLoadingState extends MoviesState {}


class MoviesSuccessState extends MoviesState {
  int  ?page;

   List<Results> ? movies=[];

  MoviesSuccessState({ this. movies,this.page});

}
final class MoviesFailedState extends MoviesState {

  String  errorMassage;
  MoviesFailedState({required this.errorMassage});
}
