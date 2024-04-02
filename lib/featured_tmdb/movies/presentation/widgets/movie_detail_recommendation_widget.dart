import 'package:flutter/material.dart';

import '../controller/movies_detail_controller.dart';
import '../../../../app/widgets/main_screen_movie_card_widget.dart';

class MovieDetailRecommendationWidget extends StatelessWidget {
  const MovieDetailRecommendationWidget({
    super.key,
    required this.moviesDetailController,
  });

  final MoviesDetailController moviesDetailController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: moviesDetailController
            .moviesDetailData.value.recommendations!.results!.length,
        itemBuilder: (context, index) {
          var result = moviesDetailController
              .moviesDetailData.value.recommendations!.results!;

          return MainScreenMovieCardWidget(
            tag: result[index].id!.toString(),
            movieId: result[index].id!,
            posterUrl: result[index].posterPath ?? null,
            title: result[index].title!,
            backdropUrl: result[index].backdropPath ?? null,
          );
        },
      ),
    );
  }
}
