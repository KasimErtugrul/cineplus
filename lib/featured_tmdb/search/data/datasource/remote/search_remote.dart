import 'dart:developer';

import 'package:cineplus/featured_tmdb/search/data/model/search_person_model.dart';
import 'package:isolate_flutter/isolate_flutter.dart';

import '../../../../../core/base/base_tmdb/base_tmdb_package.dart';

class SearchRemote {
  Future<SearchPersonModel?> getSearchPerson(
    String query, {
    String region = 'US',
    int page = 1,
  }) async {
    try {
      SearchPersonModel? value = await IsolateFlutter.createAndStart(
          _getSearchPersonRemote, query,
          debugLabel: 'Search Person Isolate');
          return  value;
    } catch (e) {
     log('Search Person İzole işlem başlatılırken bir hata oluştu: $e');

      return null;
    }
  }

  Future<SearchPersonModel> _getSearchPersonRemote(
    String query, {
    String region = 'US',
    int page = 1,
  }) async {
    Map<String, dynamic> result =
        await BaseTmdbPackage.tmdb.v3.search.queryPeople(
      query,
      page: page,
      region: region,
    ) as Map<String, dynamic>;
    return SearchPersonModel.fromJson(result);
  }
}


/*
  String query, {
  bool includeAdult = false,
  String region = 'US',
  int? year,
  int? primaryReleaseYear,
  String? language,
  int page = 1,
}
*/