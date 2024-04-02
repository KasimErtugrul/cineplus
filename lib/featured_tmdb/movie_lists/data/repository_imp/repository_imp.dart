import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/error/failure_request.dart';
import '../../../../core/error/service_exception.dart';
import '../../domain/entity/movie_lists_entity.dart';
import '../../domain/repository/repository.dart';
import '../datasource/movie_list_remote_datasource.dart';

class MovieListsRepositoryImp extends MovieListRepository {
  MovieListRemoteDatasource movieListRemoteDatasource = Get.find();

  @override
  Future<Either<Failure, MovieListEntity>> getNowPlayingList(int page) async {
    try {
      var nowPlayingRemote =
          await movieListRemoteDatasource.getNowPlayingList(page);

      return Right(nowPlayingRemote!);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieListEntity>> getPopularList(
      {int page = 1}) async {
   try {
        var popularRemote =
            await movieListRemoteDatasource.getPopularList(page: page);
        log('Popular api den çekildi.');
        return Right(popularRemote!);
      } on ServiceException catch (failure) {
        return Left(ServiceFailure(failure.errorHandle.statusMessage));
      }
   
  }

  @override
  Future<Either<Failure, MovieListEntity>> getTopRatedList(
      {int page = 1}) async {
     try {
        var topRatedRemote =
            await movieListRemoteDatasource.getTopRatedList(page: page);
        log('Top Rated api den çekildi.');
        return Right(topRatedRemote!);
      } on ServiceException catch (failure) {
        return Left(ServiceFailure(failure.errorHandle.statusMessage));
      }
  }

  @override
  Future<Either<Failure, MovieListEntity>> getUpComingList(
      {int page = 1}) async {
    try {
        var upComingRemote =
            await movieListRemoteDatasource.getUpComingList(page: page);
        log('Up Coming api den çekildi.');
        return Right(upComingRemote!);
      } on ServiceException catch (failure) {
        return Left(ServiceFailure(failure.errorHandle.statusMessage));
      }
  }
}
