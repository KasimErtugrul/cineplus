import 'package:cineplus/core/base/base_usecase/base_usecase.dart';
import 'package:cineplus/core/error/failure_request.dart';
import 'package:cineplus/featured_tmdb/movies/domain/entity/movies_entity.dart';
import 'package:cineplus/featured_tmdb/movies/domain/repository/movies_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class MoviesDetailLocalUsecase extends BaseLocalUseCase<MoviesEntity?, int> {
  final MoviesDetailLocalRepository moviesDetailLocalRepository = Get.find();
  @override
  Either<Failure, MoviesEntity?> call(int parameter) {
    return moviesDetailLocalRepository.getMoviesDetail(movieId: parameter);
  }
}
