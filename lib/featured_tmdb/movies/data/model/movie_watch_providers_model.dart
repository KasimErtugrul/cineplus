
import '../../domain/entity/movie_watch_provider_entity.dart';

class MoviesWatchProviderModel extends MoviesWatchProviderEntity {
  const MoviesWatchProviderModel({
    super.id,
    super.results,
  });

  factory MoviesWatchProviderModel.fromJson(Map<String, dynamic> json) =>
      MoviesWatchProviderModel(
        id: json["id"],
        results: json["results"] == null
            ? null
            : MoviesWatchProviderResultsModel.fromJson(json["results"]),
      );
}

class MoviesWatchProviderResultsModel extends MoviesWatchProviderResultsEntity {
  MoviesWatchProviderResultsModel({
    super.tr,
  });

  factory MoviesWatchProviderResultsModel.fromJson(Map<String, dynamic> json) =>
      MoviesWatchProviderResultsModel(
        tr: json["TR"] == null
            ? null
            : MoviesWatchProviderTrModel.fromJson(json["TR"]),
      );
}

class MoviesWatchProviderTrModel extends MoviesWatchProviderTrEntity {
  const MoviesWatchProviderTrModel({
    super.link,
    super.flatrate,
    super.buy,
    super.rent,
  });

  factory MoviesWatchProviderTrModel.fromJson(Map<String, dynamic> json) =>
      MoviesWatchProviderTrModel(
        link: json["link"],
        flatrate: json["flatrate"] == null
            ? []
            : List<MoviesWatchProviderBuyModel>.from(json["flatrate"]!
                .map((x) => MoviesWatchProviderBuyModel.fromJson(x))),
        buy: json["buy"] == null
            ? []
            : List<MoviesWatchProviderBuyModel>.from(json["buy"]!
                .map((x) => MoviesWatchProviderBuyModel.fromJson(x))),
        rent: json["rent"] == null
            ? []
            : List<MoviesWatchProviderBuyModel>.from(json["rent"]!
                .map((x) => MoviesWatchProviderBuyModel.fromJson(x))),
      );
}

class MoviesWatchProviderBuyModel extends MoviesWatchProviderBuyEntity {
  const MoviesWatchProviderBuyModel({
    super.logoPath,
    super.providerId,
    super.providerName,
    super.displayPriority,
  });

  factory MoviesWatchProviderBuyModel.fromJson(Map<String, dynamic> json) =>
      MoviesWatchProviderBuyModel(
        logoPath: json["logo_path"],
        providerId: json["provider_id"],
        providerName: json["provider_name"],
        displayPriority: json["display_priority"],
      );
}
