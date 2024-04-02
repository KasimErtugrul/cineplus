import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_usecase/base_usecase.dart';
import '../../../../core/error/failure_request.dart';
import '../entity/movie_lists_entity.dart';
import '../repository/repository.dart';

class MovieListNowPlayingUsecase extends BaseUseCase<MovieListEntity, int> {
 MovieListRepository movieListRepository = Get.find();

  @override
  Future<Either<Failure, MovieListEntity>> call(parameter) async {
    var result = await movieListRepository.getNowPlayingList(
     parameter,
    );

    return result;
  }
}
