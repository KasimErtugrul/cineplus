import 'package:equatable/equatable.dart';

class MovieListEntity extends Equatable {
    final MovieListDatesEntity? dates;
    final int? page;
    final List<MovieListResultEntity>? results;
    final int? totalPages;
    final int? totalResults;

    const MovieListEntity({
        this.dates,
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });


@override
List<Object?> get props => [dates, page, results, totalPages, totalResults];
}

class MovieListDatesEntity extends Equatable{
    final DateTime? maximum;
    final DateTime? minimum;

    const MovieListDatesEntity({
        this.maximum,
        this.minimum,
    });


@override
List<Object?> get props => [maximum, minimum];
}

class MovieListResultEntity extends Equatable {
    final bool? adult;
    final String? backdropPath;
    final List<int>? genreIds;
    final int? id;
    final String? originalLanguage;
    final String? originalTitle;
    final String? overview;
    final double? popularity;
    final String? posterPath;
    final DateTime? releaseDate;
    final String? title;
    final bool? video;
    final double? voteAverage;
    final int? voteCount;

    const MovieListResultEntity({
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


@override
List<Object?> get props => [adult, backdropPath, genreIds, id, originalLanguage, originalTitle, overview, popularity, posterPath, releaseDate, title, video, voteAverage, voteCount];
}
