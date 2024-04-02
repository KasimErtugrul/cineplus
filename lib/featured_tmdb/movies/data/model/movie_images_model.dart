

import '../../domain/entity/movie_images_entity.dart';

class MoviesImagesModel extends MoviesImagesEntity {
  const MoviesImagesModel({
    super.backdrops,
    super.id,
    super.logos,
    super.posters,
  });

  factory MoviesImagesModel.fromJson(Map<String, dynamic> json) =>
      MoviesImagesModel(
        backdrops: json["backdrops"] == null
            ? []
            : List<MovieImagesBackdropModel>.from(json["backdrops"]!
                .map((x) => MovieImagesBackdropModel.fromJson(x))),
        id: json["id"],
        logos: json["logos"] == null
            ? []
            : List<MovieImagesLogoModel>.from(
                json["logos"]!.map((x) => MovieImagesLogoModel.fromJson(x))),
        posters: json["posters"] == null
            ? []
            : List<MovieImagesBackdropModel>.from(json["posters"]!
                .map((x) => MovieImagesBackdropModel.fromJson(x))),
      );
}

class MovieImagesBackdropModel extends MovieImagesBackdropEntity {
  const MovieImagesBackdropModel({
    super.aspectRatio,
    super.height,
    super.iso6391,
    super.filePath,
    super.voteAverage,
    super.voteCount,
    super.width,
  });

  factory MovieImagesBackdropModel.fromJson(Map<String, dynamic> json) =>
      MovieImagesBackdropModel(
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        height: json["height"],
        iso6391: json["iso_639_1"],
        filePath: json["file_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
      );
}

class MovieImagesLogoModel extends MovieImagesLogoEntity {
  const MovieImagesLogoModel({
    super.aspectRatio,
    super.height,
    super.iso6391,
    super.filePath,
    super.voteAverage,
    super.voteCount,
    super.width,
  });

  factory MovieImagesLogoModel.fromJson(Map<String, dynamic> json) =>
      MovieImagesLogoModel(
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        height: json["height"],
        iso6391: json["iso_639_1"],
        filePath: json["file_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
      );
}
