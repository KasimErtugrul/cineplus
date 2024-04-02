
import 'package:cineplus/featured_tmdb/search/domain/entity/search_person_entity.dart';

class SearchPersonModel extends SearchPersonEntity{


    const SearchPersonModel({
        super.page,
        super.results,
        super.totalPages,
        super.totalResults,
    });

    factory SearchPersonModel.fromJson(Map<String, dynamic> json) => SearchPersonModel(
        page: json["page"],
        results: json["results"] == null ? [] : List<SearchPersonResultModel>.from(json["results"]!.map((x) => SearchPersonResultModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

   
}

class SearchPersonResultModel extends SearchPersonResultEntity {


    const SearchPersonResultModel({
        super.adult,
        super.gender,
        super.id,
        super.knownForDepartment,
        super.name,
        super.originalName,
        super.popularity,
        super.profilePath,
        super.knownFor,
    });

    factory SearchPersonResultModel.fromJson(Map<String, dynamic> json) => SearchPersonResultModel(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        knownFor: json["known_for"] == null ? [] : List<SearchPersonKnownForModel>.from(json["known_for"]!.map((x) => SearchPersonKnownForModel.fromJson(x))),
    );


}

class SearchPersonKnownForModel extends SearchPersonKnownForEntity {


    const SearchPersonKnownForModel({
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

    factory SearchPersonKnownForModel.fromJson(Map<String, dynamic> json) => SearchPersonKnownForModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"],
        genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

   
}
