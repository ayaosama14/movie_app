part of 'movies_bloc.dart';

@immutable
sealed class MoviesEvent {}

/// Event to fetch popular movies.
final class FetchMoviesEvent extends MoviesEvent {
  final int pageNum;

  FetchMoviesEvent( {required this.pageNum});
}
