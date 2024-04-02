import 'package:cineplus/core/error/failure_request.dart';
import 'package:cineplus/featured_tmdb/search/domain/entity/search_person_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchPersonEntity>> getSearchPerson(
    String query, {
    String region = 'US',
    int page = 1,
  });
}
