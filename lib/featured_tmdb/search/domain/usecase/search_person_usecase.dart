import 'package:cineplus/core/base/base_usecase/base_usecase.dart';
import 'package:cineplus/core/error/failure_request.dart';
import 'package:cineplus/featured_tmdb/search/domain/entity/search_person_entity.dart';
import 'package:cineplus/featured_tmdb/search/domain/repository/search_repostitory.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class SearchPersonUsecase
    extends BaseUseCase<SearchPersonEntity, SearchPersonUsecaseModel> {
  final SearchRepository searchRepostitory = Get.find();
  @override
  Future<Either<Failure, SearchPersonEntity>> call(
      SearchPersonUsecaseModel parameter) async {
    return await searchRepostitory.getSearchPerson(parameter.query,
        page: parameter.page, region: parameter.region);
  }
}

class SearchPersonUsecaseModel {
  SearchPersonUsecaseModel({
    required this.query,
    this.region = 'US',
    this.page = 1,
  });
  String query;
  String region;
  int page;
}
