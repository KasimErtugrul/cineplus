import 'package:cineplus/featured_tmdb/list/domain/entity/list_entity.dart';
import 'package:cineplus/featured_tmdb/list/domain/usecase/list_detail_usecase.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  final ListDetailUsecase listDetailUsecase = Get.find();

  Rx<ListEntity> listDetailData = const ListEntity().obs;

  RxBool listDetailError = false.obs;
  RxBool listDetailLoaded = false.obs;

  Future<void> fetchListDetail({required int listId}) async {
    var result = await listDetailUsecase.call(listId);
    return result.fold((l) {
      listDetailError.value = false;
      listDetailLoaded.value = false;
    }, (r) {
      listDetailData.value = r;
      listDetailLoaded.value = true;
    });
  }
}
