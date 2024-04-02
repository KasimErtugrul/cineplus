import 'package:cineplus/featured_tmdb/list/domain/entity/list_entity.dart';

class ListModel extends ListEntity {
  ListModel({
    super.createdBy,
    super.description,
    super.favoriteCount,
    super.id,
    super.iso6391,
    super.itemCount,
    super.items,
    super.name,
    super.page,
    super.posterPath,
    super.totalPages,
    super.totalResults,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        createdBy: json["created_by"],
        description: json["description"],
        favoriteCount: json["favorite_count"],
        id: json["id"],
        iso6391: json["iso_639_1"],
        itemCount: json["item_count"],
        items: json["items"] == null
            ? []
            : List<ListItemModel>.from(
                json["items"]!.map((x) => ListItemModel.fromJson(x))),
        name: json["name"],
        page: json["page"],
        posterPath: json["poster_path"],
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class ListItemModel extends ListItemEntity {
  ListItemModel({
    super.adult,
    super.backdropPath,
    super.id,
    super.title,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.posterPath,
    super.mediaType,
    super.runtime,
    super.revenue,
    super.genreIds,
    super.popularity,
    super.releaseDate,
    super.video,
    super.voteAverage,
    super.voteCount,
  });

  factory ListItemModel.fromJson(Map<String, dynamic> json) => ListItemModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"],
        runtime: json["runtime"],
        revenue: json["revenue"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );
}
