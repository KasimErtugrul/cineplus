import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../model/movie_lists_model.dart';

//  await movieListLocal.create(result, 'movie-list-upComing',page);
class MovieListLocal {
  final box = GetStorage('movieList');

  Future<bool> create(Map<String, dynamic> data, String key) async {
    try {
      await box.write(key, data);

      return true;
    } catch (e) {
      log('movieList Hata oluştu: $e');
      return false;
    }
  }

  Future<bool> createTimeStamp({String key='', int page=1}) async {
    var nowTime = DateTime.now().millisecondsSinceEpoch;
    log(
      '$key-$page-time - value:${nowTime.toString()}',
    );
    try {
      await box.write('$key-$page-time', nowTime.toString());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

   bool checkIfCacheValid({String key='', int page=1}) {
    final String? cachedTime = box.read('$key-$page-time');
    log('checkifcachevalid: $cachedTime');

    if (cachedTime != null) {
      final cachedDateTime =
          DateTime.fromMillisecondsSinceEpoch(int.parse(cachedTime));
      final difference = DateTime.now().difference(cachedDateTime);
      final differenceInHours = difference.inHours;

      if (differenceInHours > 24) {
        log('Cache süresi geçmiş');
        return false;
      } else {
        log('Cache süresi geçmemiş');
        return true;
      }
    } else {
      log('$key zaman damgası bulunamadı');
      return false;
    }
  }

  //'movie-list-nowplaying-$page'
  MovieListModel? getLocalNowPlayingList({int page = 1}) {
    bool time = checkIfCacheValid(key:'movie-list-nowplaying',page: page);
    if (time) {
      var result = box.read('movie-list-nowplaying-$page');
      if (result != null) {
        log('now playing cache de bulundu');
        return MovieListModel.fromJson(result as Map<String, dynamic>);
      } else {
        log('now playing cache de bulunamadı');
        return null;
      }
    } else {
      log('now playing zaman dışı');
    }
    return null;
  }

  MovieListModel? getLocalPopularList({int page = 1}) {
    bool time = checkIfCacheValid(key:'movie-list-popular',page: page);
    if (time) {
      var result = box.read('movie-list-popular-$page');
      if (result != null) {
        log('popular cache de bulundu');
        return MovieListModel.fromJson(result as Map<String, dynamic>);
      } else {
        log('popular cache de bulunamadı');
        return null;
      }
    } else {
      log('popular zaman dışı');
    }
    return null;
  }

  MovieListModel? getLocaTopRatedList({int page = 1}) {
    bool time = checkIfCacheValid(key:'movie-list-topRated',page:  page);
    if (time) {
      var result = box.read('movie-list-topRated-$page');
      if (result != null) {
        log('topRated cache de bulundu');
        return MovieListModel.fromJson(result as Map<String, dynamic>);
      } else {
        log('topRated cache de bulanamdı');
        return null;
      }
    } else {
      log('topRated zaman dışı');
    }

    return null;
  }

  MovieListModel? getLocaUpComingList({int page = 1}) {
    bool time = checkIfCacheValid(key:'movie-list-upComing',page: page);
    if (time) {
      var result = box.read('movie-list-upComing-$page');

      if (result != null) {
        log('upComing cache de bulundu');
        return MovieListModel.fromJson(result as Map<String, dynamic>);
      } else {
        log('upComing cache de bulunamadı');
        return null;
      }
    } else {
      log('upComing zaman dışı');
    }

    return null;
  }
}
