import 'package:cineplus/core/base/base_usecase/base_usecase.dart';
import 'package:cineplus/core/error/failure_request.dart';
import 'package:cineplus/featured_tmdb/movies/domain/entity/movie_images_entity.dart';
import 'package:cineplus/featured_tmdb/movies/domain/repository/movies_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class MoviesDetailImagesUsecase extends BaseUseCase<MoviesImagesEntity, int> {
  final MoviesDetailRepository moviesDetailRepository = Get.find();
  @override
  Future<Either<Failure, MoviesImagesEntity>> call(int parameter) async {
    return await moviesDetailRepository.getMoviesImages(movieId: parameter);
  }
}
