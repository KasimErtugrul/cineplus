import 'dart:developer';

import 'package:isolate_flutter/isolate_flutter.dart';

import '../../../../../core/base/base_tmdb/base_tmdb_package.dart';
import '../../model/movie_images_model.dart';
import '../../model/movie_watch_providers_model.dart';
import '../../model/movies_model.dart';

class MoviesDetailRemote {
  
  Future<MoviesModel?> moviesDetail({required int movieId}) async {
    try {
      MoviesModel? value = await IsolateFlutter.createAndStart(
          _getMoviesDetail, movieId,
          debugLabel: 'Movies Detail Isolate');

      return value!;
    } catch (e) {
      log('Movies Detail İzole işlem başlatılırken bir hata oluştu: $e');

      return null;
    }
  }

  Future<MoviesImagesModel?> moviesImages({required int movieId}) async {
    try {
      MoviesImagesModel? value = await IsolateFlutter.createAndStart(
          _getMovieImagesRemote, movieId,
          debugLabel: 'Movies Images Isolate');

      return value!;
    } catch (e) {
      log('Movies Images İzole işlem başlatılırken bir hata oluştu: $e');

      return null;
    }
  }

  Future<MoviesWatchProviderModel?> moviesWatchProvider(
      {required int movieId}) async {
    try {
      MoviesWatchProviderModel? value = await IsolateFlutter.createAndStart(
          _getMovieWatchProviderRemote, movieId,
          debugLabel: 'Movies Images Isolate');

      return value!;
    } catch (e) {
      log('Movies Images İzole işlem başlatılırken bir hata oluştu: $e');

      return null;
    }
  }

//Now Playing Remote
  Future<MoviesModel> _getMoviesDetail(int movieId) async {
    Map<String,
        dynamic> result = await BaseTmdbPackage.tmdb.v3.movies.getDetails(
            movieId,
            appendToResponse:
                'credits,external_ids,images,keywords,recommendations,similar,videos,watch_provider,release_dates')
        as Map<String, dynamic>;
        
   
   // log('remote map: $result');
    return MoviesModel.fromJson(result);
  }

  Future<MoviesImagesModel> _getMovieImagesRemote(int movieId) async {
    Map<String, dynamic> result = await BaseTmdbPackage.tmdb.v3.movies
            .getImages(movieId, includeImageLanguage: 'en,null')
        as Map<String, dynamic>;
        log('movie images: $result');

    return MoviesImagesModel.fromJson(result);
  }

  Future<MoviesWatchProviderModel> _getMovieWatchProviderRemote(
      int movieId) async {
    Map<String, dynamic> result = await BaseTmdbPackage.tmdb.v3.movies
        .getWatchProviders(movieId) as Map<String, dynamic>;

    return MoviesWatchProviderModel.fromJson(result);
  }
}
