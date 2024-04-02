import 'package:equatable/equatable.dart';

class MovieCollectionsEntity extends Equatable{
    final int? id;
    final String? name;
    final String? overview;
    final String? posterPath;
    final String? backdropPath;
    final List<MovieCollectionsPartEntity>? parts;

    const MovieCollectionsEntity({
        this.id,
        this.name,
        this.overview,
        this.posterPath,
        this.backdropPath,
        this.parts,
    });


@override
List<Object?> get props => [id, name, overview, posterPath, backdropPath, parts];
}

class MovieCollectionsPartEntity extends Equatable {
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

    const MovieCollectionsPartEntity({
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
