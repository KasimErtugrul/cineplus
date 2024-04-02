
import '../../domain/entity/movie_lists_entity.dart';

class MovieListModel extends MovieListEntity {
  const MovieListModel({
    super.dates,
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
  });

  factory MovieListModel.fromJson(Map<String, dynamic> json) => MovieListModel(
        dates: json["dates"] == null
            ? null
            : MovieListDatesModel.fromJson(json["dates"]),
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<MovieListResultModel>.from(
                json["results"]!.map((x) => MovieListResultModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class MovieListDatesModel extends MovieListDatesEntity {
  const MovieListDatesModel({
    super.maximum,
    super.minimum,
  });

  factory MovieListDatesModel.fromJson(Map<String, dynamic> json) =>
      MovieListDatesModel(
        maximum:
            json["maximum"] == null ? null : DateTime.parse(json["maximum"]),
        minimum:
            json["minimum"] == null ? null : DateTime.parse(json["minimum"]),
      );
}

class MovieListResultModel extends MovieListResultEntity {
  const MovieListResultModel({
    super.adult,
    super.backdropPath,
    super.genreIds,
    super.id,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    super.releaseDate,
    super.title,
    super.video,
    super.voteAverage,
    super.voteCount,
  });

  factory MovieListResultModel.fromJson(Map<String, dynamic> json) =>
      MovieListResultModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );
}
