import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineplus/featured_tmdb/movies/presentation/movie_detail_util_pages/movie_backdrop_view_page.dart';
import 'package:cineplus/featured_tmdb/movies/presentation/movie_detail_util_pages/movie_posters_view_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/api/api_settings.dart';
import '../controller/movies_detail_controller.dart';

class MovieDetailPosterAndBackdropWidget extends StatelessWidget {
  const MovieDetailPosterAndBackdropWidget({
    super.key,
    required this.posterUrl,
    required this.moviesDetailController,
    required this.backdropUrl,
  });

  final String? posterUrl;
  final MoviesDetailController moviesDetailController;
  final String? backdropUrl;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FadeInLeft(
            delay: const Duration(milliseconds: 580),
            child: GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Posterler'),
                  Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 0),
                            imageUrl: ApiSettings.imagePathOriginal(posterUrl!),
                            placeholder: (context, url) => Image.network(
                              ApiSettings.imagePath185(posterUrl!),
                              fit: BoxFit.fill,
                            ),
                            width: 150,
                          )),
                      moviesDetailController
                                  .moviesDetailImagesData.value.posters !=
                              null
                          ? Positioned(
                              left: 10,
                              top: 10,
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  moviesDetailController.moviesDetailImagesData
                                      .value.posters!.length
                                      .toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoviePostersViewPage(
                          moviesDetailController: moviesDetailController,
                          appBar: moviesDetailController
                              .moviesDetailData.value.title!,
                          heroTag: moviesDetailController
                              .moviesDetailData.value.title!),
                    ));
              },
            ),
          ),
          const Gap(10),
          FadeInLeft(
            delay: const Duration(milliseconds: 640),
            child: GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Arka Plan Resimleri'),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: backdropUrl != null
                            ? CachedNetworkImage(
                                fadeInDuration: const Duration(milliseconds: 0),
                                imageUrl:
                                    ApiSettings.imagePathOriginal(backdropUrl!),
                                placeholder: (context, url) => Image.network(
                                  ApiSettings.imagePath185(backdropUrl!),
                                  fit: BoxFit.fill,
                                ),
                                width: 400,
                              )
                            : Image.asset('assets/image/no_image_backdrop.png'),
                      ),
                      Positioned(
                        left: 10,
                        top: 10,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            moviesDetailController.moviesDetailImagesData.value
                                    .backdrops?.length
                                    .toString() ??
                                '',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieBackdropViewPage(
                          moviesDetailController: moviesDetailController,
                          appBar: moviesDetailController
                              .moviesDetailData.value.title!,
                          heroTag: moviesDetailController
                              .moviesDetailData.value.title!),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
