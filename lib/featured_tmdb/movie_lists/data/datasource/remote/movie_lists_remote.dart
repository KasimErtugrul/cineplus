import 'dart:developer';

import 'package:isolate_flutter/isolate_flutter.dart';

import '../../../../../core/base/base_tmdb/base_tmdb_package.dart';
import '../../model/movie_lists_model.dart';

class MovieListsRemote {
  Future<MovieListModel?> nowPlayingIsolate({int page = 1}) async {
    try {
      MovieListModel? value = await IsolateFlutter.createAndStart(
          _getNowPlayingList, page,
          debugLabel: 'Now Playing Isolate');

      return value!;
    } catch (e) {
      log('İzole işlem başlatılırken bir hata oluştu: $e');

      return null;
    }
  }

//Now Playing Remote
  Future<MovieListModel> _getNowPlayingList(int page) async {
    Map<String, dynamic> result =
        await BaseTmdbPackage.tmdb.v3.movies.getNowPlaying(
      region: 'tr',
      page: page,
    ) as Map<String, dynamic>;

    return MovieListModel.fromJson(result);
  }

  Future<MovieListModel?> popularListIsolate({int page = 1}) async {
    try {
      MovieListModel? value = await IsolateFlutter.createAndStart(
          _getPopularList, page,
          debugLabel: 'Popular Movie List Isolate');
      return value!;
    } catch (e) {
      log('İzole işlem başlatılırken bir hata oluştu: $e');

      return null;
    }
  }

  // Popular Remote
  Future<MovieListModel> _getPopularList(int page) async {
    Map<String, dynamic> result =
        await BaseTmdbPackage.tmdb.v3.movies.getPopular(
      region: 'tr',
      page: page,
    ) as Map<String, dynamic>;

    return MovieListModel.fromJson(result);
  }

  Future<MovieListModel?> topRatedListIsolate({int page = 1}) async {
    try {
      MovieListModel? value = await IsolateFlutter.createAndStart(
          _getTopRatedList, page,
          debugLabel: 'Top Rated Movie List Isolate');
      return value!;
    } catch (e) {
      log('İzole işlem başlatılırken bir hata oluştu: $e');

      return null;
    }
  }

  // Top Rated Remote
  Future<MovieListModel> _getTopRatedList(int page) async {
    Map<String, dynamic> result =
        await BaseTmdbPackage.tmdb.v3.movies.getTopRated(
      region: 'tr',
      page: page,
    ) as Map<String, dynamic>;

    return MovieListModel.fromJson(result);
  }

  Future<MovieListModel?> upComingListIsolate({int page = 1}) async {
    try {
      MovieListModel? value = await IsolateFlutter.createAndStart(
          _getUpComingList, page,
          debugLabel: 'Up Coming Movie List Isolate');
      return value!;
    } catch (e) {
      log('İzole işlem başlatılırken bir hata oluştu: $e');

      return null;
    }
  }

  // Up Coming Remote
  Future<MovieListModel> _getUpComingList(int page) async {
    Map<String, dynamic> result =
        await BaseTmdbPackage.tmdb.v3.movies.getUpcoming(
      //region: 'tr',
      page: page,
    ) as Map<String, dynamic>;

    return MovieListModel.fromJson(result);
  }
}
