import 'package:cineplus/featured_tmdb/movies/data/datasource/local/movies_detail_local.dart';
import 'package:get/get.dart';

import '../model/movies_model.dart';

abstract class MoviesDetailLocalDatasource {
   Future<bool> saveMovies(MoviesModel data, int movieId);
  MoviesModel? readMovies(int movieId);
}

class MoviesDetailLocalDatasourceImpl extends MoviesDetailLocalDatasource {
  final MoviesDetailLocal moviesDetailLocal = Get.find();
 
  @override
  MoviesModel? readMovies(int movieId) {
    return moviesDetailLocal.readMovies( movieId);
  }

  @override
  Future<bool> saveMovies(
      MoviesModel data, int movieId) async {
    return await moviesDetailLocal.saveMovies(
         data,  movieId);
  }
}
