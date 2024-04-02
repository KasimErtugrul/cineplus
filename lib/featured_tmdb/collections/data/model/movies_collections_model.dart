import 'package:cineplus/featured_tmdb/collections/domain/entity/movies_collections_entity.dart';

class MovieCollectionsModel extends MovieCollectionsEntity {
  const MovieCollectionsModel({
    super.id,
    super.name,
    super.overview,
    super.posterPath,
    super.backdropPath,
    super.parts,
  });

  factory MovieCollectionsModel.fromJson(Map<String, dynamic> json) =>
      MovieCollectionsModel(
        id: json["id"],
        name: json["name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
        parts: json["parts"] == null
            ? []
            : List<MoviesCollectionPartModel>.from(json["parts"]!
                .map((x) => MoviesCollectionPartModel.fromJson(x))),
      );
}

class MoviesCollectionPartModel extends MovieCollectionsPartEntity {
  const MoviesCollectionPartModel({
    super.adult,
    super.backdropPath,
    super.id,
    super.title,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.posterPath,
    super.mediaType,
    super.genreIds,
    super.popularity,
    super.releaseDate,
    super.video,
    super.voteAverage,
    super.voteCount,
  });

  factory MoviesCollectionPartModel.fromJson(Map<String, dynamic> json) =>
      MoviesCollectionPartModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        releaseDate: json["release_date"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );
}
