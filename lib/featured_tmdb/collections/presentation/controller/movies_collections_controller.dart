import 'package:cineplus/featured_tmdb/collections/domain/entity/movies_collections_entity.dart';
import 'package:cineplus/featured_tmdb/collections/domain/usecase/movies_collection_detail_usecase.dart';
import 'package:get/get.dart';

class MoviesCollectionsController extends GetxController {
  final MoviesCollectionDetailUsecase moviesCollectionDetailUsecase =
      Get.find();

  Rx<MovieCollectionsEntity> movieCollectionDetail =
      const MovieCollectionsEntity().obs;

  RxBool moviesCollectionDetailError = false.obs;
  RxBool moviesCollectionDetailLoaded = false.obs;

  Future<void> fetchMoviesCollectionDetail({required int collectionId}) async {
    moviesCollectionDetailLoaded.value = false;
    var result = await moviesCollectionDetailUsecase.call(collectionId);
    result.fold((l) {
      moviesCollectionDetailError.value = true;
      moviesCollectionDetailLoaded.value = false;
    }, (r) {
      movieCollectionDetail.value = r;
      moviesCollectionDetailLoaded.value = true;
    });
  }
}
