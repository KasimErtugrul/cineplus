// To parse this JSON data, do
//
//     final moviesModel = moviesModelFromJson(jsonString);

import 'dart:convert';

import 'package:cineplus/featured_tmdb/movies/domain/entity/movies_entity.dart';

MoviesModel moviesModelFromJson(String str) =>
    MoviesModel.fromJson(json.decode(str));

String moviesModelToJson(MoviesModel data) => json.encode(data.toJson());

class MoviesModel extends MoviesEntity {
  const MoviesModel({
    super.adult,
    super.backdropPath,
    super.belongsToCollection,
    super.budget,
    super.genres,
    super.homepage,
    super.id,
    super.imdbId,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    super.productionCompanies,
    super.productionCountries,
    super.releaseDate,
    super.revenue,
    super.runtime,
    super.spokenLanguages,
    super.status,
    super.tagline,
    super.title,
    super.video,
    super.voteAverage,
    super.voteCount,
    super.externalIds,
    super.credits,
    super.keywords,
    super.recommendations,
    super.similar,
    super.videos,
    //  super.releaseDates,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"] == null
            ? null
            : BelongsToCollection.fromJson(json["belongs_to_collection"]),
        budget: json["budget"],
        genres: json["genres"] == null
            ? []
            : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: json["production_companies"] == null
            ? []
            : List<ProductionCompany>.from(json["production_companies"]!
                .map((x) => ProductionCompany.fromJson(x))),
        productionCountries: json["production_countries"] == null
            ? []
            : List<ProductionCountry>.from(json["production_countries"]!
                .map((x) => ProductionCountry.fromJson(x))),
        releaseDate: json["release_date"],
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: json["spoken_languages"] == null
            ? []
            : List<SpokenLanguage>.from(json["spoken_languages"]!
                .map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        externalIds: json["external_ids"] == null
            ? null
            : ExternalIds.fromJson(json["external_ids"]),
        credits:
            json["credits"] == null ? null : Credits.fromJson(json["credits"]),
        keywords: json["keywords"] == null
            ? null
            : Keywords.fromJson(json["keywords"]),
        recommendations: json["recommendations"] == null
            ? null
            : Recommendations.fromJson(json["recommendations"]),
        similar:
            json["similar"] == null ? null : Similar.fromJson(json["similar"]),
        videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
        //  releaseDates: json["release_dates"] == null
        //      ? null
        //    : ReleaseDates.fromJson(json["release_dates"]),
      );

  @override
  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection?.toJson(),
        "budget": budget,
        "genres": genres == null
            ? []
            : List<Genre>.from(genres!.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": productionCompanies == null
            ? []
            : List<ProductionCompany>.from(
                productionCompanies!.map((x) => x.toJson())),
        "production_countries": productionCountries == null
            ? []
            : List<ProductionCountry>.from(
                productionCountries!.map((x) => x.toJson())),
        "release_date": releaseDate,
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages": spokenLanguages == null
            ? []
            : List<SpokenLanguage>.from(
                spokenLanguages!.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "external_ids": externalIds?.toJson(),
        "credits": credits?.toJson(),
        "keywords": keywords?.toJson(),
        "recommendations": recommendations?.toJson(),
        "similar": similar?.toJson(),
        "videos": videos?.toJson(),
        //"release_dates": releaseDates?.toJson(),
      };
}

class BelongsToCollection extends BelongsToCollectionEntity {
  const BelongsToCollection({
    super.id,
    super.name,
    super.posterPath,
    super.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      BelongsToCollection(
        id: json["id"],
        name: json["name"],
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
      };
}

class Credits extends CreditsEntity {
  const Credits({
    super.cast,
    super.crew,
  });

  factory Credits.fromJson(Map<String, dynamic> json) => Credits(
        cast: json["cast"] == null
            ? []
            : List<Cast>.from(json["cast"]!.map((x) => Cast.fromJson(x))),
        crew: json["crew"] == null
            ? []
            : List<Crew>.from(json["crew"]!.map((x) => Crew.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "cast":
            cast == null ? [] : List<Cast>.from(cast!.map((x) => x.toJson())),
        "crew":
            crew == null ? [] : List<Crew>.from(crew!.map((x) => x.toJson())),
      };
}

class Cast extends CastEntity {
  const Cast({
    super.adult,
    super.gender,
    super.id,
    super.knownForDepartment,
    super.name,
    super.originalName,
    super.popularity,
    super.profilePath,
    super.castId,
    super.character,
    super.creditId,
    super.order,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
      };
}

class Crew extends CrewEntity {
  const Crew({
    super.adult,
    super.gender,
    super.id,
    super.knownForDepartment,
    super.name,
    super.originalName,
    super.popularity,
    super.profilePath,
    super.creditId,
    super.department,
    super.job,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => Crew(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        creditId: json["credit_id"],
        department: json["department"],
        job: json["job"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "credit_id": creditId,
        "department": department,
        "job": job,
      };
}

class ExternalIds extends ExternalIdsEntity {
  const ExternalIds({
    super.imdbId,
    super.wikidataId,
    super.facebookId,
    super.instagramId,
    super.twitterId,
  });

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        imdbId: json["imdb_id"],
        wikidataId: json["wikidata_id"],
        facebookId: json["facebook_id"],
        instagramId: json["instagram_id"],
        twitterId: json["twitter_id"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "imdb_id": imdbId,
        "wikidata_id": wikidataId,
        "facebook_id": facebookId,
        "instagram_id": instagramId,
        "twitter_id": twitterId,
      };
}

class Genre extends GenreEntity {
  const Genre({
    super.id,
    super.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Keywords extends KeywordsEntity {
  const Keywords({
    super.keywords,
  });

  factory Keywords.fromJson(Map<String, dynamic> json) => Keywords(
        keywords: json["keywords"] == null
            ? []
            : List<Genre>.from(json["keywords"]!.map((x) => Genre.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "keywords": keywords == null
            ? []
            : List<Genre>.from(keywords!.map((x) => x.toJson())),
      };
}

class ProductionCompany extends ProductionCompanyEntity {
  const ProductionCompany({
    super.id,
    super.logoPath,
    super.name,
    super.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}

class ProductionCountry extends ProductionCountryEntity {
  const ProductionCountry({
    super.iso31661,
    super.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
      };
}

class Recommendations extends RecommendationsEntity {
  const Recommendations({
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
  });

  factory Recommendations.fromJson(Map<String, dynamic> json) =>
      Recommendations(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<RecommendationsResult>.from(
                json["results"]!.map((x) => RecommendationsResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<RecommendationsResult>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class RecommendationsResult extends RecommendationsResultEntity {
  const RecommendationsResult({
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

  factory RecommendationsResult.fromJson(Map<String, dynamic> json) =>
      RecommendationsResult(
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

  @override
  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaType,
        "genre_ids":
            genreIds == null ? [] : List<int>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "release_date":
            releaseDate, //"${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}"
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

class ReleaseDates extends ReleaseDatesEntity {
  const ReleaseDates({
    super.results,
  });

  factory ReleaseDates.fromJson(Map<String, dynamic> json) => ReleaseDates(
        results: json["results"] == null
            ? []
            : List<ReleaseDatesResult>.from(
                json["results"]!.map((x) => ReleaseDatesResult.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<ReleaseDatesResult>.from(results!.map((x) => x.toJson())),
      };
}

class ReleaseDatesResult extends ReleaseDatesResultEntity {
  const ReleaseDatesResult({
    super.iso31661,
    super.releaseDates,
  });

  factory ReleaseDatesResult.fromJson(Map<String, dynamic> json) =>
      ReleaseDatesResult(
        iso31661: json["iso_3166_1"],
        releaseDates: json["release_dates"] == null
            ? []
            : List<ReleaseDate>.from(
                json["release_dates"]!.map((x) => ReleaseDate.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "release_dates": releaseDates == null
            ? []
            : List<ReleaseDate>.from(releaseDates!.map((x) => x.toJson())),
      };
}

class ReleaseDate extends ReleaseDateEntity {
  const ReleaseDate({
    super.certification,
    super.descriptors,
    super.iso6391,
    super.note,
    super.releaseDate,
    super.type,
  });

  factory ReleaseDate.fromJson(Map<String, dynamic> json) => ReleaseDate(
        certification: json["certification"],
        descriptors: json["descriptors"] == null
            ? []
            : List<dynamic>.from(json["descriptors"]!.map((x) => x)),
        iso6391: json["iso_639_1"],
        note: json["note"],
        releaseDate: json["release_date"],
        type: json["type"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "certification": certification,
        "descriptors": descriptors == null
            ? []
            : List<dynamic>.from(descriptors!.map((x) => x)),
        "iso_639_1": iso6391,
        "note": note,
        "release_date": releaseDate,
        "type": type,
      };
}

class Similar extends SimilarEntity {
  const Similar({
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
  });

  factory Similar.fromJson(Map<String, dynamic> json) => Similar(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<SimilarResult>.from(
                json["results"]!.map((x) => SimilarResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<SimilarResult>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class SimilarResult extends SimilarResultEntity {
  const SimilarResult({
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

  factory SimilarResult.fromJson(Map<String, dynamic> json) => SimilarResult(
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
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids":
            genreIds == null ? [] : List<int>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

class SpokenLanguage extends SpokenLanguageEntity {
  const SpokenLanguage({
    super.englishName,
    super.iso6391,
    super.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
}

class Videos extends VideosEntity {
  const Videos({
    super.results,
  });

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        results: json["results"] == null
            ? []
            : List<VideosResult>.from(
                json["results"]!.map((x) => VideosResult.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<VideosResult>.from(results!.map((x) => x.toJson())),
      };
}

class VideosResult extends VideosResultEntity {
  const VideosResult({
    super.iso6391,
    super.iso31661,
    super.name,
    super.key,
    super.site,
    super.size,
    super.type,
    super.official,
    super.publishedAt,
    super.id,
  });

  factory VideosResult.fromJson(Map<String, dynamic> json) => VideosResult(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: json["published_at"],
        id: json["id"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "key": key,
        "site": site,
        "size": size,
        "type": type,
        "official": official,
        "published_at": publishedAt,
        "id": id,
      };
}
