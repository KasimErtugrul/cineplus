
import 'package:tmdb_api/tmdb_api.dart';

import '../../api/api_settings.dart';

class BaseTmdbPackage {
  static final tmdb = TMDB(
    ApiKeys(ApiSettings.apiKey, ApiSettings.baseToken),
    defaultLanguage: 'tr-TR',
    logConfig: const ConfigLogger(
        //  showUrlLogs: true,
        // showLogs: true, //must be true than only all other logs will be shown
        //  showErrorLogs: true,
        //  showInfoLogs: true,
        //  showWarningLogs: true,
        ),
  );
}
