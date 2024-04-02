import 'package:cineplus/featured_tmdb/collections/data/datasource/remote/movies_collection_remote.dart';
import 'package:get/get.dart';

import '../model/movies_collections_model.dart';

abstract class MoviesCollectionRemoteDatasource {
  Future<MovieCollectionsModel?> moviesCollectionRemote(
      {required int collectionId});
}

class MoviesCollectionRemoteDataSourceImpl
    implements MoviesCollectionRemoteDatasource {
  final MoviesCollectionRemote moviesCollection = Get.find();
  @override
  Future<MovieCollectionsModel?> moviesCollectionRemote(
      {required int collectionId}) async {
    return await moviesCollection.moviesCollectionRemote(
        collectionId: collectionId);
  }
}
