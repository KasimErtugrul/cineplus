import 'package:cineplus/core/error/failure_request.dart';
import 'package:cineplus/featured_tmdb/list/data/datasource/list_remote_datasource.dart';

import 'package:cineplus/featured_tmdb/list/domain/entity/list_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/error/service_exception.dart';
import '../../domain/repository/list_repository.dart';

class ListRepositoryImp extends ListRepository {
  final ListRemoteDatasource listRemoteDatasource = Get.find();
  @override
  Future<Either<Failure, ListEntity>> getListDetail(
      {required int listId}) async {
    try {
      var listDetail = await listRemoteDatasource.listDetail(listId: listId);
      return Right(listDetail!);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }
}
