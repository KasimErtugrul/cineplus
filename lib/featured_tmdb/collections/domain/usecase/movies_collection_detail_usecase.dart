import 'package:cineplus/core/base/base_usecase/base_usecase.dart';
import 'package:cineplus/core/error/failure_request.dart';
import 'package:cineplus/featured_tmdb/collections/domain/entity/movies_collections_entity.dart';
import 'package:cineplus/featured_tmdb/collections/domain/repository/movies_collection_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class MoviesCollectionDetailUsecase
    extends BaseUseCase<MovieCollectionsEntity, int> {
  final MoviesCollectionRepository moviesCollectionRepository = Get.find();
  @override
  Future<Either<Failure, MovieCollectionsEntity>> call(int parameter) async {
    return await moviesCollectionRepository.getMoviesCollection(
        collectionId: parameter);
  }
}
