import 'package:cineplus/featured_tmdb/movies/data/datasource/remote/movies_detail_remote.dart';
import 'package:cineplus/featured_tmdb/movies/data/model/movies_model.dart';
import 'package:get/get.dart';

import '../model/movie_images_model.dart';
import '../model/movie_watch_providers_model.dart';

abstract class MoviesDetailRemoteDatasource {
  Future<MoviesModel?> getMoviesDetail({required int movieId});
  Future<MoviesImagesModel?> getMoviesImages({required int movieId});
  Future<MoviesWatchProviderModel?> getMoviesWatchProvider(
      {required int movieId});
}

class MoviesDetailRemoteDatasourceImp extends MoviesDetailRemoteDatasource {
  final MoviesDetailRemote moviesDetailRemote = Get.find();
  @override
  Future<MoviesModel?> getMoviesDetail({required int movieId}) async {
    return await moviesDetailRemote.moviesDetail(movieId: movieId);
  }

  @override
  Future<MoviesImagesModel?> getMoviesImages({required int movieId}) async {
    return await moviesDetailRemote.moviesImages(movieId: movieId);
  }

  @override
  Future<MoviesWatchProviderModel?> getMoviesWatchProvider(
      {required int movieId}) async {
    return await moviesDetailRemote.moviesWatchProvider(movieId: movieId);
  }
}
