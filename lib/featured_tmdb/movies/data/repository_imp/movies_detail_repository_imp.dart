import 'package:cineplus/core/error/failure_request.dart';
import 'package:cineplus/core/error/service_exception.dart';
import 'package:cineplus/featured_tmdb/movies/data/datasource/movies_detail_remote_datasource.dart';
import 'package:cineplus/featured_tmdb/movies/data/model/movies_model.dart';
import 'package:cineplus/featured_tmdb/movies/domain/entity/movie_images_entity.dart';
import 'package:cineplus/featured_tmdb/movies/domain/entity/movie_watch_provider_entity.dart';
import 'package:cineplus/featured_tmdb/movies/domain/entity/movies_entity.dart';
import 'package:cineplus/featured_tmdb/movies/domain/repository/movies_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class MoviesDetailRepositoryImp extends MoviesDetailRepository {
  final MoviesDetailRemoteDatasource moviesDetailRemoteDatasource = Get.find();

  @override
  Future<Either<Failure, MoviesEntity>> getMoviesDetail(
      {required int movieId}) async {
    try {
      MoviesModel? moviesDetail =
          await moviesDetailRemoteDatasource.getMoviesDetail(movieId: movieId);

      return Right(moviesDetail!);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesImagesEntity>> getMoviesImages(
      {required int movieId}) async {
    try {
      var moviesDetail =
          await moviesDetailRemoteDatasource.getMoviesImages(movieId: movieId);
      return Right(moviesDetail!);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesWatchProviderEntity>> getMoviesWatchProvider(
      {required int movieId}) async {
    try {
      var moviesDetail = await moviesDetailRemoteDatasource
          .getMoviesWatchProvider(movieId: movieId);
      return Right(moviesDetail!);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }
  

}



  
