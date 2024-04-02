import 'package:get/get.dart';

import '../model/movie_lists_model.dart';
import 'local/local_datasource.dart';

abstract class MovieListLocalDatasource {
  MovieListModel? getLocalNowPlayingList({int page = 1});
  MovieListModel? getLocalPopularList({int page = 1});
  MovieListModel? getLocaTopRatedList({int page = 1});
  MovieListModel? getLocaUpComingList({int page = 1});

  Future<bool> createTimeStamp({String key = '', int page = 1});
  bool checkIfCacheValid({String key = '', int page = 1});
}

class MovieListLocalDatasourceImp extends MovieListLocalDatasource {
  MovieListLocal movieListLocal = Get.find();

  @override
  MovieListModel? getLocaTopRatedList({int page = 1}) {
    return movieListLocal.getLocaTopRatedList(page: page);
  }

  @override
  MovieListModel? getLocaUpComingList({int page = 1}) {
    return movieListLocal.getLocaUpComingList(page: page);
  }

  @override
  MovieListModel? getLocalNowPlayingList({int page = 1}) {
    return movieListLocal.getLocalNowPlayingList(page: page);
  }

  @override
  MovieListModel? getLocalPopularList({int page = 1}) {
    return movieListLocal.getLocalPopularList(page: page);
  }

  @override
  bool checkIfCacheValid({String key = '', int page = 1}) {
    return movieListLocal.checkIfCacheValid(key: key, page: page);
  }

  @override
  Future<bool> createTimeStamp({String key = '', int page = 1}) async {
    return await movieListLocal.createTimeStamp(key: key, page: page);
  }
}
