import 'package:cineplus/core/error/failure_request.dart';
import 'package:cineplus/featured_tmdb/list/domain/entity/list_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ListRepository {
  Future<Either<Failure, ListEntity>> getListDetail({required int listId});
}
