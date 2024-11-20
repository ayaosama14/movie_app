part of 'movies_bloc.dart';

@immutable
sealed class MoviesState {}

/// Initial state when no action has been performed.
final class MoviesInitial extends MoviesState {}

/// Loading state when data is being fetched.
final class MoviesLoadingState extends MoviesState {}

/// Success state when data has been successfully fetched.
class MoviesSuccessState extends MoviesState {
  final int? page;
  final List<Results>? movies;

  MoviesSuccessState({this.movies, this.page});
}

/// Failed state when an error occurs during fetching.
final class MoviesFailedState extends MoviesState {
  final String errorMessage;

  MoviesFailedState({required this.errorMessage});
}
