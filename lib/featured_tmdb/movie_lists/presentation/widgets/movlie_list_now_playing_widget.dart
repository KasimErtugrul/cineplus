import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/widgets/main_screen_movie_card_widget.dart';
import '../controller/movie_list_controller.dart';

class MovieListNowPlayingWidget extends StatelessWidget {
  const MovieListNowPlayingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MovieListController movieListController = Get.find();
    log('nowplayin widget: ${movieListController.nowPlayingLoading.value}');
    return Obx(
      () => SizedBox(
        height: 240,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: movieListController.nowPlayingList.value.results!.length,
          itemBuilder: (context, index) {
            var result = movieListController.nowPlayingList.value.results!;
            log('now playin tag: ${result[index].id!.toString()}');
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
