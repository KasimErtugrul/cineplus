import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/widgets/main_screen_movie_card_widget.dart';
import '../controller/movie_list_controller.dart';

class MovieListUpComingWidget extends StatelessWidget {
  const MovieListUpComingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MovieListController movieListController = Get.find();
    return Obx(
      () => SizedBox(
        height: 240,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: movieListController.upComingList.value.results!.length,
          itemBuilder: (context, index) {
            var result = movieListController.upComingList.value.results!;
            return MainScreenMovieCardWidget(
              backdropUrl: result[index].backdropPath!,
              posterUrl: result[index].posterPath!,
              title: result[index].title,
              movieId: result[index].id!,
               tag: result[index].id!.toString(),
            );
          },
        ),
      ),
    );
  }
}
