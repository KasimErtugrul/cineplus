import 'package:cineplus/core/error/failure_request.dart';
import 'package:cineplus/featured_tmdb/collections/data/datasource/movies_collection_remote_datasource.dart';

import 'package:cineplus/featured_tmdb/collections/domain/entity/movies_collections_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/error/service_exception.dart';
import '../../domain/repository/movies_collection_repository.dart';

class MoviesCollectionRepositoryImp extends MoviesCollectionRepository {
  final MoviesCollectionRemoteDatasource moviesCollectionRemoteDataSource =
      Get.find();
  @override
  Future<Either<Failure, MovieCollectionsEntity>> getMoviesCollection(
      {required int collectionId}) async {
    try {
      var collectionDetail = await moviesCollectionRemoteDataSource
          .moviesCollectionRemote(collectionId: collectionId);
      return Right(collectionDetail!);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }
}
