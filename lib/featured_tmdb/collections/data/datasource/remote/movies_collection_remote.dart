import 'dart:developer';

import 'package:cineplus/featured_tmdb/collections/data/model/movies_collections_model.dart';
import 'package:isolate_flutter/isolate_flutter.dart';

import '../../../../../core/base/base_tmdb/base_tmdb_package.dart';

class MoviesCollectionRemote {
  Future<MovieCollectionsModel?> moviesCollectionRemote(
      {required int collectionId}) async {
    try {
      MovieCollectionsModel? value = await IsolateFlutter.createAndStart(
          _getMoviesCollectionRemote, collectionId,
          debugLabel: 'Collection Detail');
      return value;
    } catch (e) {
      log('Collection Detail İzole işlem başlatılırken bir hata oluştu: $e');

      return null;
    }
  }

  Future<MovieCollectionsModel> _getMoviesCollectionRemote(
      int collectionId) async {
    Map<String, dynamic> result = await BaseTmdbPackage.tmdb.v3.collections
        .getDetails(collectionId) as Map<String, dynamic>;

    return MovieCollectionsModel.fromJson(result);
  }
}
