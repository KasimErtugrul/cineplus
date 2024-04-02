import 'package:cineplus/featured_tmdb/movies/data/model/movies_model.dart';
import 'package:get_storage/get_storage.dart';

class MoviesDetailLocal {
  var box = GetStorage();

  Future<bool> saveMovies(MoviesModel data, int movieId) async {
    var moviesData = moviesModelToJson(data);
    await box.write(movieId.toString(), moviesData);

    return true;
  }

  MoviesModel? readMovies(int movieId) {
    String? result = box.read<String>(movieId.toString());
    MoviesModel? moviesData = moviesModelFromJson(result!);
    return moviesData;
  }
}
