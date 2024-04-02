import 'package:cineplus/featured_tmdb/movie_lists/data/datasource/remote/movie_lists_remote.dart';
import 'package:get/get.dart';

import '../model/movie_lists_model.dart';

abstract class MovieListRemoteDatasource {
  Future<MovieListModel?> getNowPlayingList(int page);
  Future<MovieListModel?> getPopularList({int page = 1});

  Future<MovieListModel?> getTopRatedList({int page = 1});

  Future<MovieListModel?> getUpComingList({int page = 1});
}

class MovieListRemoteDatasourceImp extends MovieListRemoteDatasource {
  MovieListsRemote movieListRemote = Get.find();

  @override
  Future<MovieListModel?> getNowPlayingList(int page) async {
    return await movieListRemote.nowPlayingIsolate(page: page);
  }

  @override
  Future<MovieListModel?> getPopularList({int page = 1}) async {
    return await movieListRemote.popularListIsolate(page: page);
  }

  @override
  Future<MovieListModel?> getTopRatedList({int page = 1}) async {
    return await movieListRemote.topRatedListIsolate(page: page);
  }

  @override
  Future<MovieListModel?> getUpComingList({int page = 1}) async {
    return await movieListRemote.upComingListIsolate(page: page);
  }
}
