import 'dart:developer';

import 'package:cineplus/featured_tmdb/list/data/model/list_model.dart';
import 'package:isolate_flutter/isolate_flutter.dart';

import '../../../../../core/base/base_tmdb/base_tmdb_package.dart';

class ListRemote {
  Future<ListModel?> listDetail({required int listId}) async {
    try {
      ListModel? value = await IsolateFlutter.createAndStart(
          _getListDetail, listId,
          debugLabel: 'List Id Isolate');
      return value!;
    } catch (e) {
      log('List Detail İzole işlem başlatılırken bir hata oluştu: $e');

      return null;
    }
  }

  Future<ListModel> _getListDetail(int listId) async {
    Map<String, dynamic> result =
        await BaseTmdbPackage.tmdb.v3.lists.getDetails(
      listId.toString(),
    ) as Map<String, dynamic>;

    return ListModel.fromJson(result);
  }
}
