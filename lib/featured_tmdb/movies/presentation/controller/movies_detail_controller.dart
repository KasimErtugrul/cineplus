import 'dart:developer';

import 'package:cineplus/featured_tmdb/movies/domain/entity/movies_entity.dart';
import 'package:cineplus/featured_tmdb/movies/domain/usecase/movies_detail_images_usecase.dart';
import 'package:cineplus/featured_tmdb/movies/domain/usecase/movies_detail_usecase.dart';
import 'package:cineplus/featured_tmdb/movies/domain/usecase/movies_detail_watch_provider_usecase.dart';
import 'package:get/get.dart';

import '../../../../app/utils/enums.dart';
import '../../domain/entity/movie_images_entity.dart';
import '../../domain/entity/movie_watch_provider_entity.dart';
import '../../domain/usecase/movies_detail_local_usecase.dart';

class MoviesDetailController extends GetxController {
  final MoviesDetailUsecase moviesDetailUsecase = Get.find();
  final MoviesDetailLocalUsecase moviesDetailLocalUsecase = Get.find();
  final MoviesDetailImagesUsecase moviesDetailImagesUsecase = Get.find();
  final MoviesDetailWatchProviderUsecase moviesDetailWatchProviderUsecase =
      Get.find();

  Rx<MoviesEntity> moviesDetailData = const MoviesEntity().obs;
  Rx<MoviesEntity> moviesDetailLocalData = const MoviesEntity().obs;
  Rx<MoviesWatchProviderEntity> moviesDetailWatchProviderData =
      const MoviesWatchProviderEntity().obs;
  Rx<MoviesImagesEntity> moviesDetailImagesData =
      const MoviesImagesEntity().obs;

  RxBool moviesDetailError = false.obs;
  RxBool moviesDetailLoading = false.obs;
  RxBool moviesDetailLocalError = false.obs;
  RxBool moviesDetailLocalLoading = true.obs;
  RxBool moviesDetailImageError = false.obs;
  RxBool moviesDetailImageLoading = false.obs;
  RxBool moviesDetailWatchProviderError = false.obs;
  RxBool moviesDetailWatchProviderLoading = false.obs;

  Rx<CastEnum> castEnum = CastEnum.cast.obs;
  void castToCrew(CastEnum castData) {
    if (castData == CastEnum.cast) {
      castEnum.value = CastEnum.cast;
    } else {
      castEnum.value = CastEnum.crew;
    }
  }

  fetchMoviesDetailLast({required int movieId}) async {
    fetchMoviesDetailLocal(movieId: movieId);
    if (!moviesDetailLocalLoading.value) {
      await fetchMoviesDetail(
        movieId: movieId,
      );
    }
  }

  void fetchMoviesDetailLocal({required int movieId}) {
    var local = moviesDetailLocalUsecase.call(movieId);
    local.fold((l) {
      moviesDetailLocalError.value = true;
      moviesDetailLocalLoading.value = false;
    }, (r) {
      moviesDetailData.value = r!;
      moviesDetailLocalLoading.value = true;
    });
  }

  Future<void> fetchMoviesDetail({required int movieId}) async {
    log('controller gelen film id: $movieId');
    var result = await moviesDetailUsecase.call(movieId);
    result.fold((l) {
      moviesDetailError.value = true;
      moviesDetailLoading.value = false;
    }, (r) {
      moviesDetailData.value = r;
      moviesDetailLoading.value = true;
    });
  }

  Future<void> fetchMoviesDetailImages({required int movieId}) async {
    var result = await moviesDetailImagesUsecase.call(movieId);
    result.fold((l) {
      moviesDetailImageError.value = true;
      moviesDetailImageLoading.value = false;
    }, (r) {
      moviesDetailImagesData.value = r;
      moviesDetailImageLoading.value = true;
    });
  }

  Future<void> fetchMoviesDetailWatchProvider({required int movieId}) async {
    var result = await moviesDetailWatchProviderUsecase.call(movieId);
    result.fold((l) {
      moviesDetailWatchProviderError.value = true;
      moviesDetailWatchProviderLoading.value = false;
    }, (r) {
      moviesDetailWatchProviderData.value = r;
      moviesDetailWatchProviderLoading.value = true;
    });
  }
}
