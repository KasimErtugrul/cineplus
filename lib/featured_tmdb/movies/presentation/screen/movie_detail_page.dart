import 'dart:developer';

import 'package:cineplus/featured_tmdb/movies/presentation/controller/movies_detail_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../widgets/movie_detail_belong_to_collection_widget.dart';
import '../widgets/movie_detail_button_groups_widget.dart';
import '../widgets/movie_detail_cast_and_crew_widget.dart';
import '../widgets/movie_detail_overview_widget.dart';
import '../widgets/movie_detail_poster_and_backdrop_widget.dart';
import '../widgets/movie_detail_recommendation_widget.dart';
import '../widgets/movie_detail_similar_widget.dart';
import '../widgets/movie_detail_stack_widget.dart';
import '../widgets/movie_detail_tagline_widget.dart';

class MovieDetailPage extends StatelessWidget {
  final int movieId;
  final String tag;
  final String appBar;
  final String? posterUrl;
  final String? backdropUrl;
  const MovieDetailPage(
      {super.key,
      required this.movieId,
      required this.tag,
      required this.appBar,
      this.posterUrl,
      this.backdropUrl});

  @override
  Widget build(BuildContext context) {
    log('detail page tag: $tag');
    MoviesDetailController moviesDetailController =
        Get.find<MoviesDetailController>()
          ..fetchMoviesDetail(movieId: movieId)
          ..fetchMoviesDetailImages(movieId: movieId)
          ..fetchMoviesDetailWatchProvider(movieId: movieId);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
            //  moviesDetailController.resetLoading();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.blue,
          ),
        ),
        title: Text(
          appBar,
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              icon: const Icon(Icons.home)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {
                Get.changeTheme(ThemeData.dark());
              },
              icon: const Icon(Icons.theater_comedy)),
        ],
      ),
      body: Obx(
        () => ListView(
          children: [
            MovieDetailStackWidget(
              moviesDetailController: moviesDetailController,
              tag: tag,
              posterUrl: posterUrl ?? null,
              backdropUrl: backdropUrl ?? null,
            ),
            moviesDetailController.moviesDetailLoading.value
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MovieDetailButtonGroupsWidget(),
                        const Divider(),
                        moviesDetailController
                                .moviesDetailData.value.tagline!.isNotEmpty
                            ? MovieDetailTaglineWidget(
                                moviesDetailController: moviesDetailController)
                            : const SizedBox(),
                        moviesDetailController
                                .moviesDetailData.value.overview!.isNotEmpty
                            ? MovieDetailOverviewWidget(
                                moviesDetailController: moviesDetailController)
                            : const SizedBox(),
                        moviesDetailController.moviesDetailData.value.credits!
                                .cast!.isNotEmpty
                            ? MovieDetailCastAndCrewWidget(
                                moviesDetailController: moviesDetailController,
                              )
                            : SizedBox(),
                        const Divider(),
                        posterUrl != null && backdropUrl != null
                            ? MovieDetailPosterAndBackdropWidget(
                                posterUrl: posterUrl,
                                moviesDetailController: moviesDetailController,
                                backdropUrl: backdropUrl)
                            : SizedBox(),
                        const Divider(),
                        moviesDetailController.moviesDetailData.value
                                    .belongsToCollection !=
                                null
                            ? MovieDetailBelongsToCollectionWidget(
                                appBar: appBar,
                                moviesDetailController: moviesDetailController)
                            : const SizedBox(),
                        const Divider(),
                        moviesDetailController.moviesDetailData.value.similar!
                                .results!.isNotEmpty
                            ? const Text('Önerilen Filmler')
                            : const SizedBox(),
                        moviesDetailController.moviesDetailData.value
                                .recommendations!.results!.isNotEmpty
                            ? MovieDetailRecommendationWidget(
                                moviesDetailController: moviesDetailController)
                            : const SizedBox(),
                        const Divider(),
                        moviesDetailController.moviesDetailData.value.similar!
                                .results!.isNotEmpty
                            ? const Text('Benzer Filmler')
                            : const SizedBox(),
                        moviesDetailController.moviesDetailData.value.similar!
                                .results!.isNotEmpty
                            ? MovieDetailSimilarWidget(
                                moviesDetailController: moviesDetailController)
                            : const SizedBox(),
                        const Divider(),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
