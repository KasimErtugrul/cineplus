import 'package:cineplus/core/base/base_usecase/base_usecase.dart';
import 'package:cineplus/core/error/failure_request.dart';
import 'package:cineplus/featured_tmdb/list/domain/entity/list_entity.dart';
import 'package:cineplus/featured_tmdb/list/domain/repository/list_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class ListDetailUsecase extends BaseUseCase<ListEntity, int> {
  final ListRepository listRepository = Get.find();
  @override
  Future<Either<Failure, ListEntity>> call(int parameter) async {
    return await listRepository.getListDetail(listId: parameter);
  }
}
