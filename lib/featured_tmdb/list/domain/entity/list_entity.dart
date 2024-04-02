import 'package:equatable/equatable.dart';

class ListEntity extends Equatable{
    final String? createdBy;
    final String? description;
    final int? favoriteCount;
    final int? id;
    final String? iso6391;
    final int? itemCount;
    final List<ListItemEntity>? items;
    final String? name;
    final int? page;
    final String? posterPath;
    final int? totalPages;
    final int? totalResults;

    const ListEntity({
        this.createdBy,
        this.description,
        this.favoriteCount,
        this.id,
        this.iso6391,
        this.itemCount,
        this.items,
        this.name,
        this.page,
        this.posterPath,
        this.totalPages,
        this.totalResults,
    });


@override
List<Object?> get props => [createdBy, description, favoriteCount, id, iso6391, itemCount, items, name, page, posterPath, totalPages, totalResults];
}

class ListItemEntity extends Equatable {
    final bool? adult;
    final String? backdropPath;
    final int? id;
    final String? title;
    final String? originalLanguage;
    final String? originalTitle;
    final String? overview;
    final String? posterPath;
    final String? mediaType;
    final int? runtime;
    final int? revenue;
    final List<int>? genreIds;
    final double? popularity;
    final DateTime? releaseDate;
    final bool? video;
    final double? voteAverage;
    final int? voteCount;

    const ListItemEntity({
        this.adult,
        this.backdropPath,
        this.id,
        this.title,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.posterPath,
        this.mediaType,
        this.runtime,
        this.revenue,
        this.genreIds,
        this.popularity,
        this.releaseDate,
        this.video,
        this.voteAverage,
        this.voteCount,
    });


@override
List<Object?> get props => [adult, backdropPath, id, title, originalLanguage, originalTitle, overview, posterPath, mediaType, runtime, revenue, genreIds, popularity, releaseDate, video, voteAverage, voteCount];
}
