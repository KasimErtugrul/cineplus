import 'dart:developer';
import 'package:get/get.dart';

import '../../domain/entity/movie_lists_entity.dart';
import '../../domain/usecase/movie_list_nowplaying_usecase.dart';
import '../../domain/usecase/movie_list_popular_usecase.dart';
import '../../domain/usecase/movie_list_toprated_usecase.dart';
import '../../domain/usecase/movie_lists_upcoming_usecases.dart';

class MovieListController extends GetxController {


  MovieListNowPlayingUsecase nowPlayingUsecase =
     Get.find();
  MovieListPopularUsecase popularUsecase =  Get.find();
  MovieListTopRatedUsecase topRatedUsecase =
       Get.find();
  MovieListUpComingUsecase upComingUsecase =
       Get.find();

  Rx<MovieListEntity> nowPlayingList = const MovieListEntity().obs;
  Rx<MovieListEntity> popularList = const MovieListEntity().obs;
  Rx<MovieListEntity> topRatedList = const MovieListEntity().obs;
  Rx<MovieListEntity> upComingList = const MovieListEntity().obs;

  RxBool nowPlayingLoading = false.obs;
  RxBool popularLoading = false.obs;
  RxBool topRatedLoading = false.obs;
  RxBool upComingLoading = false.obs;

  RxBool nowPlayingError = false.obs;
  RxBool popularError = false.obs;
  RxBool topRatedError = false.obs;
  RxBool upComingError = false.obs;

  Future<void> fetchNowPlayingController({int page = 1}) async {
    var result = await nowPlayingUsecase.call(page);
    result.fold((l) {
      nowPlayingError.value = true;
      log(l.message);
    }, (r) {
      nowPlayingList.value = r;
      nowPlayingLoading.value = true;
    });
  }

  Future<void> fetchPopularController({int page = 1}) async {
    var result = await popularUsecase.call(page);
    result.fold((l) {
      popularError.value = true;
      log(l.message);
    }, (r) {
      log('list popular geldi');
      popularList.value = r;
      popularLoading.value = true;
    });
  }

  Future<void> fetchTopRatedController({int page = 1}) async {
    var result = await topRatedUsecase.call(page);
    result.fold((l) {
      topRatedError.value = true;
      log(l.message);
    }, (r) {
      topRatedList.value = r;
      topRatedLoading.value = true;
    });
  }

  Future<void> fetchUpComingController({int page = 2}) async {
    var result = await upComingUsecase.call(page);
    result.fold((l) {
      upComingError.value = true;
      log(l.message);
    }, (r) {
      upComingList.value = r;
      upComingLoading.value = true;
    });
  }
}
