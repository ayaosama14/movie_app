import 'package:get_it/get_it.dart';

import '../featchers/home_fetcher/data/Models/pop_movie_model.dart';
import '../featchers/home_fetcher/data/apis/api_imp.dart';
import '../featchers/home_fetcher/data/pagination.dart';
import '../featchers/home_fetcher/data/repo_imp/pop_movie_repo_imp.dart';
import '../featchers/home_fetcher/presentation/manager/pop_movies_provider.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
//instance api
//one instance repo

   getIt.registerSingleton<ApiImp>(ApiImp());
  //one instance repo
   getIt.registerSingleton<RepoImp>(RepoImp());


//one instance provider
  getIt.registerSingleton<PopularMoviesProvider>(PopularMoviesProvider());
  //???????????? getIt.registerSingleton<PopularResModel> do not work ??????????????
 // getIt.registerSingleton<PopularResModel>(PopularResModel());
}
