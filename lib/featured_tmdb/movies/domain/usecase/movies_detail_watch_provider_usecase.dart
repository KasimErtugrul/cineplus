import 'package:cineplus/core/base/base_usecase/base_usecase.dart';
import 'package:cineplus/core/error/failure_request.dart';
import 'package:cineplus/featured_tmdb/movies/domain/repository/movies_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../entity/movie_watch_provider_entity.dart';

class MoviesDetailWatchProviderUsecase extends BaseUseCase<MoviesWatchProviderEntity, int> {
  final MoviesDetailRepository moviesDetailRepository = Get.find();
  @override
  Future<Either<Failure, MoviesWatchProviderEntity>> call(int parameter) async {
    return await moviesDetailRepository.getMoviesWatchProvider(movieId: parameter);
  }
}
