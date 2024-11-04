import 'package:either_dart/either.dart';

import '../data/model.dart';

abstract class Repo{
//entity
//call apis
  Future<Either<String, PopularResModel>> fetchPopularMovies();

}