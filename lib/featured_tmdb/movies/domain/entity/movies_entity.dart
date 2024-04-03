import 'package:equatable/equatable.dart';

class MoviesEntity extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final BelongsToCollectionEntity? belongsToCollection;
  final int? budget;
  final List<GenreEntity>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompanyEntity>? productionCompanies;
  final List<ProductionCountryEntity>? productionCountries;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguageEntity>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final ExternalIdsEntity? externalIds;
  final CreditsEntity? credits;
  final KeywordsEntity? keywords;
  final RecommendationsEntity? recommendations;
  final SimilarEntity? similar;
  final VideosEntity? videos;
//  final ReleaseDatesEntity? releaseDates;

  const MoviesEntity({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.externalIds,
    this.credits,
    this.keywords,
    this.recommendations,
    this.similar,
    this.videos,
    // this.releaseDates,
  });
  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection?.toJson(),
        "budget": budget,
        "genres": genres == null
            ? []
            : List<GenreEntity>.from(genres!.map((x) => x.toJson())),
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
            : List<ProductionCompanyEntity>.from(
                productionCompanies!.map((x) => x.toJson())),
        "production_countries": productionCountries == null
            ? []
            : List<ProductionCountryEntity>.from(
                productionCountries!.map((x) => x.toJson())),
        "release_date": releaseDate,
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages": spokenLanguages == null
            ? []
            : List<SpokenLanguageEntity>.from(
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

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        belongsToCollection,
        budget,
        genres,
        homepage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        releaseDate,
        revenue,
        runtime,
        spokenLanguages,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
        externalIds,
        credits,
        keywords,
        recommendations,
        similar,
        videos,
        // releaseDates
      ];
}

class BelongsToCollectionEntity extends Equatable {
  final int? id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;

  const BelongsToCollectionEntity({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
      };

  @override
  List<Object?> get props => [id, name, posterPath, backdropPath];
}

class CreditsEntity extends Equatable {
  final List<CastEntity>? cast;
  final List<CrewEntity>? crew;

  const CreditsEntity({
    this.cast,
    this.crew,
  });

  Map<String, dynamic> toJson() => {
        "cast": cast == null
            ? []
            : List<CastEntity>.from(cast!.map((x) => x.toJson())),
        "crew": crew == null
            ? []
            : List<CrewEntity>.from(crew!.map((x) => x.toJson())),
      };
  @override
  List<Object?> get props => [cast, crew];
}

class CastEntity extends Equatable {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String? creditId;
  final int? order;

  const CastEntity({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });
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

  @override
  List<Object?> get props => [
        adult,
        gender,
        id,
        knownForDepartment,
        name,
        originalName,
        popularity,
        profilePath,
        castId,
        character,
        creditId,
        order
      ];
}

class CrewEntity extends Equatable {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final String? creditId;
  final String? department;
  final String? job;

  const CrewEntity({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });
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

  @override
  List<Object?> get props => [
        adult,
        gender,
        id,
        knownForDepartment,
        name,
        originalName,
        popularity,
        profilePath,
        creditId,
        department,
        job
      ];
}

class ExternalIdsEntity extends Equatable {
  final String? imdbId;
  final String? wikidataId;
  final dynamic facebookId;
  final dynamic instagramId;
  final dynamic twitterId;

  const ExternalIdsEntity({
    this.imdbId,
    this.wikidataId,
    this.facebookId,
    this.instagramId,
    this.twitterId,
  });
  Map<String, dynamic> toJson() => {
        "imdb_id": imdbId,
        "wikidata_id": wikidataId,
        "facebook_id": facebookId,
        "instagram_id": instagramId,
        "twitter_id": twitterId,
      };

  @override
  List<Object?> get props =>
      [imdbId, wikidataId, facebookId, instagramId, twitterId];
}

class GenreEntity extends Equatable {
  final int? id;
  final String? name;

  const GenreEntity({
    this.id,
    this.name,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
  @override
  List<Object?> get props => [id, name];
}

class KeywordsEntity extends Equatable {
  final List<GenreEntity>? keywords;

  const KeywordsEntity({
    this.keywords,
  });

  Map<String, dynamic> toJson() => {
        "keywords": keywords == null
            ? []
            : List<GenreEntity>.from(keywords!.map((x) => x.toJson())),
      };
  @override
  List<Object?> get props => [keywords];
}

class ProductionCompanyEntity extends Equatable {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  const ProductionCompanyEntity({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });
  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };

  @override
  List<Object?> get props => [id, logoPath, name, originCountry];
}

class ProductionCountryEntity extends Equatable {
  final String? iso31661;
  final String? name;

  const ProductionCountryEntity({
    this.iso31661,
    this.name,
  });

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
      };
  @override
  List<Object?> get props => [iso31661, name];
}

class RecommendationsEntity extends Equatable {
  final int? page;
  final List<RecommendationsResultEntity>? results;
  final int? totalPages;
  final int? totalResults;

  const RecommendationsEntity({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<RecommendationsResultEntity>.from(
                results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}

class RecommendationsResultEntity extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? title;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final List<int>? genreIds;
  final double? popularity;
  final String? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const RecommendationsResultEntity({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
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
        "release_date": releaseDate,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        id,
        title,
        originalLanguage,
        originalTitle,
        overview,
        posterPath,
        mediaType,
        genreIds,
        popularity,
        releaseDate,
        video,
        voteAverage,
        voteCount
      ];
}

class ReleaseDatesEntity extends Equatable {
  final List<ReleaseDatesResultEntity>? results;

  const ReleaseDatesEntity({
    this.results,
  });

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<ReleaseDatesResultEntity>.from(
                results!.map((x) => x.toJson())),
      };
  @override
  List<Object?> get props => [results];
}

class ReleaseDatesResultEntity extends Equatable {
  final String? iso31661;
  final List<ReleaseDateEntity>? releaseDates;

  const ReleaseDatesResultEntity({
    this.iso31661,
    this.releaseDates,
  });
  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "release_dates": releaseDates == null
            ? []
            : List<ReleaseDateEntity>.from(
                releaseDates!.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [iso31661, releaseDates];
}

class ReleaseDateEntity extends Equatable {
  final String? certification;
  final List<dynamic>? descriptors;
  final String? iso6391;
  final String? note;
  final String? releaseDate;
  final int? type;

  const ReleaseDateEntity({
    this.certification,
    this.descriptors,
    this.iso6391,
    this.note,
    this.releaseDate,
    this.type,
  });

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
  @override
  List<Object?> get props =>
      [certification, descriptors, iso6391, note, releaseDate, type];
}

class SimilarEntity extends Equatable {
  final int? page;
  final List<SimilarResultEntity>? results;
  final int? totalPages;
  final int? totalResults;

  const SimilarEntity({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<SimilarResultEntity>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}

class SimilarResultEntity extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const SimilarResultEntity({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
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
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount
      ];
}

class SpokenLanguageEntity extends Equatable {
  final String? englishName;
  final String? iso6391;
  final String? name;

  const SpokenLanguageEntity({
    this.englishName,
    this.iso6391,
    this.name,
  });

  Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
  @override
  List<Object?> get props => [englishName, iso6391, name];
}

class VideosEntity extends Equatable {
  final List<VideosResultEntity>? results;

  const VideosEntity({
    this.results,
  });

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<VideosResultEntity>.from(results!.map((x) => x.toJson())),
      };
  @override
  List<Object?> get props => [results];
}

class VideosResultEntity extends Equatable {
  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final String? publishedAt;
  final String? id;

  const VideosResultEntity({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });
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

  @override
  List<Object?> get props => [
        iso6391,
        iso31661,
        name,
        key,
        site,
        size,
        type,
        official,
        publishedAt,
        id
      ];
}
