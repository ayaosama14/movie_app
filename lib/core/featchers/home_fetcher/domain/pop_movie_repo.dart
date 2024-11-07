import 'package:either_dart/either.dart';

import '../data/Models/pop_movie_model.dart';

abstract class Repo{

  Future<Either<String, PopularResModel>> fetchPopularMovies();

}