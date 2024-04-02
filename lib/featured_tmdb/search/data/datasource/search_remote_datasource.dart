import 'package:cineplus/featured_tmdb/search/data/datasource/remote/search_remote.dart';
import 'package:get/get.dart';

import '../model/search_person_model.dart';

abstract class SearchRemoteDatasource {
  Future<SearchPersonModel?> getSearchPerson(
    String query, {
    String region = 'US',
    int page = 1,
  });
}

class SearchRemoteDatasourceImp implements SearchRemoteDatasource {
  final SearchRemote searchRemote = Get.find();
  @override
  Future<SearchPersonModel?> getSearchPerson(String query,
      {String region = 'US', int page = 1}) async {
    return await searchRemote.getSearchPerson(query,
        page: page, region: region);
  }
}
