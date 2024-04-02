import 'package:cineplus/core/error/failure_request.dart';
import 'package:cineplus/featured_tmdb/collections/domain/entity/movies_collections_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesCollectionRepository {
  Future<Either<Failure, MovieCollectionsEntity>> getMoviesCollection(
      {required int collectionId});
}
