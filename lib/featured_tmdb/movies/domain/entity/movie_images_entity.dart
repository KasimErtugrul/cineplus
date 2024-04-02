import 'package:equatable/equatable.dart';

class MoviesImagesEntity extends Equatable {
  final List<MovieImagesBackdropEntity>? backdrops;
  final int? id;
  final List<MovieImagesLogoEntity>? logos;
  final List<MovieImagesBackdropEntity>? posters;

  const MoviesImagesEntity({
    this.backdrops,
    this.id,
    this.logos,
    this.posters,
  });

  Map<String, dynamic> toJson() {
    return {
      'backdrops': backdrops?.map((backdrop) => backdrop.toJson()).toList(),
      'id': id,
      'logos': logos?.map((logo) => logo.toJson()).toList(),
      'posters': posters?.map((poster) => poster.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [backdrops, id, logos, posters];
}

class MovieImagesBackdropEntity extends Equatable {
  final double? aspectRatio;
  final int? height;
  final String? iso6391;
  final String? filePath;
  final double? voteAverage;
  final int? voteCount;
  final int? width;

  const MovieImagesBackdropEntity({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  @override
  List<Object?> get props =>
      [aspectRatio, height, iso6391, filePath, voteAverage, voteCount, width];

  Map<String, dynamic> toJson() {
    return {
      'aspect_ratio': aspectRatio,
      'height': height,
      'iso_639_1': iso6391,
      'file_path': filePath,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'width': width,
    };
  }
}

class MovieImagesLogoEntity extends Equatable {
  final double? aspectRatio;
  final int? height;
  final String? iso6391;
  final String? filePath;
  final double? voteAverage;
  final int? voteCount;
  final int? width;

  const MovieImagesLogoEntity({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  @override
  List<Object?> get props =>
      [aspectRatio, height, iso6391, filePath, voteAverage, voteCount, width];

  Map<String, dynamic> toJson() {
    return {
      'aspect_ratio': aspectRatio,
      'height': height,
      'iso_639_1': iso6391,
      'file_path': filePath,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'width': width,
    };
  }
}
