import 'package:cineplus/featured_tmdb/list/data/datasource/remote/list_remote.dart';
import 'package:get/get.dart';

import '../model/list_model.dart';

abstract class ListRemoteDatasource {
  Future<ListModel?> listDetail({required int listId});
}

class ListRemoteDatasourceImp extends ListRemoteDatasource {
  final ListRemote listRemote = Get.find();
  @override
  Future<ListModel?> listDetail({required int listId}) async {
    return await listRemote.listDetail(listId: listId);
  }
}
