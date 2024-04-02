import 'package:cineplus/core/error/failure_request.dart';
import 'package:cineplus/featured_tmdb/movies/domain/entity/movie_images_entity.dart';
import 'package:cineplus/featured_tmdb/movies/domain/entity/movie_watch_provider_entity.dart';
import 'package:cineplus/featured_tmdb/movies/domain/entity/movies_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesDetailRepository {
  Future<Either<Failure, MoviesEntity>> getMoviesDetail({required int movieId});
  Future<Either<Failure, MoviesImagesEntity>> getMoviesImages({required int movieId});
  Future<Either<Failure, MoviesWatchProviderEntity>> getMoviesWatchProvider({required int movieId});

}

abstract class MoviesDetailLocalRepository{
  Either<Failure, MoviesEntity> getMoviesDetail({required int movieId});
}
