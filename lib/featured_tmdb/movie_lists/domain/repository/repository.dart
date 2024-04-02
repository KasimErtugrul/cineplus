import 'package:dartz/dartz.dart';

import '../../../../core/error/failure_request.dart';
import '../entity/movie_lists_entity.dart';

abstract class MovieListRepository {
  Future<Either<Failure, MovieListEntity>> getNowPlayingList(int page);
  Future<Either<Failure, MovieListEntity>> getPopularList({int page});
  Future<Either<Failure, MovieListEntity>> getTopRatedList({int page});
  Future<Either<Failure, MovieListEntity>> getUpComingList({int page});
}
