import 'package:equatable/equatable.dart';

class SearchPersonEntity extends Equatable{
    final int? page;
    final List<SearchPersonResultEntity>? results;
    final int? totalPages;
    final int? totalResults;

    const SearchPersonEntity({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });


@override
List<Object?> get props => [page, results, totalPages, totalResults];
}

class SearchPersonResultEntity extends Equatable {
    final bool? adult;
    final int? gender;
    final int? id;
    final String? knownForDepartment;
    final String? name;
    final String? originalName;
    final double? popularity;
    final String? profilePath;
    final List<SearchPersonKnownForEntity>? knownFor;

    const SearchPersonResultEntity({
        this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath,
        this.knownFor,
    });


@override
List<Object?> get props => [adult, gender, id, knownForDepartment, name, originalName, popularity, profilePath, knownFor];
}

class SearchPersonKnownForEntity extends Equatable {
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
    final DateTime? releaseDate;
    final bool? video;
    final double? voteAverage;
    final int? voteCount;

    const SearchPersonKnownForEntity({
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


@override
List<Object?> get props => [adult, backdropPath, id, title, originalLanguage, originalTitle, overview, posterPath, mediaType, genreIds, popularity, releaseDate, video, voteAverage, voteCount];
}
