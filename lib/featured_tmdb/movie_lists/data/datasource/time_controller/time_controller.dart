import 'dart:developer';

import 'package:get_storage/get_storage.dart';

class TimeController {
  static final box = GetStorage('movieList');

  static bool checkIfCacheValid(String movieListType) {
    final cachedTime = box.read(movieListType);
    final isCacheExist = cachedTime != null;

    if (isCacheExist) {
      final cachedDateTime =
          DateTime.fromMillisecondsSinceEpoch(int.parse(cachedTime));
      final difference = DateTime.now().difference(cachedDateTime);
      final differenceInHours = difference.inHours;

      if (differenceInHours > 24) {
        log('Cache süresi geçmiş');
        return false;
      } else {
        log('Cache süresi geçmemiş');
        return true;
      }
    } else {
      log('Cache bulunamadı');
      return false;
    }
  }
}
