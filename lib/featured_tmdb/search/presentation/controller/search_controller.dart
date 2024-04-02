import 'package:cineplus/featured_tmdb/search/domain/entity/search_person_entity.dart';
import 'package:cineplus/featured_tmdb/search/domain/usecase/search_person_usecase.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final SearchPersonUsecase searchPersonUsecase = Get.find();

  Rx<SearchPersonEntity> searchPersonData = const SearchPersonEntity().obs;

  RxBool searchPersonError = false.obs;
  RxBool searchPersonLoading = false.obs;

  Future<void> fetchSearchPerson(
    String query, {
    String region = 'US',
    int page = 1,
  }) async {
    SearchPersonUsecaseModel value =
        SearchPersonUsecaseModel(query: query, page: page, region: region);

    var result = await searchPersonUsecase.call(value);
    result.fold((l) {
      searchPersonError.value = false;
      searchPersonLoading.value = false;
    }, (r) {
      searchPersonData.value = r;
      searchPersonLoading.value = true;
    });
  }
}
