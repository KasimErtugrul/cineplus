import 'package:cineplus/core/error/failure_request.dart';
import 'package:cineplus/featured_tmdb/search/data/datasource/search_remote_datasource.dart';
import 'package:cineplus/featured_tmdb/search/domain/entity/search_person_entity.dart';
import 'package:cineplus/featured_tmdb/search/domain/repository/search_repostitory.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/error/service_exception.dart';

class SearchRepositoryImp extends SearchRepository {
  final SearchRemoteDatasource searchRemoteDataSource = Get.find();
  @override
  Future<Either<Failure, SearchPersonEntity>> getSearchPerson(String query,
      {String region = 'US', int page = 1}) async {
    try {
      var searchPerson = await searchRemoteDataSource.getSearchPerson(query,
          page: page, region: region);
      return Right(searchPerson!);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }
}
