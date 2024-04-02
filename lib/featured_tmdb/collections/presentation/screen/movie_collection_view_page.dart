import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineplus/core/api/api_settings.dart';
import 'package:cineplus/featured_tmdb/movies/presentation/screen/movie_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controller/movies_collections_controller.dart';

class MovieCollectionViewPage extends StatelessWidget {
  final int collectionId;

  const MovieCollectionViewPage({
    super.key,
    required this.collectionId,
  });

  @override
  Widget build(BuildContext context) {
    final MoviesCollectionsController moviesCollectionsController = Get.find()
      ..fetchMoviesCollectionDetail(collectionId: collectionId);
    log('gelen collection id: $collectionId');
    return Scaffold(
      appBar: AppBar(
        title: Text(
            moviesCollectionsController.movieCollectionDetail.value.name ?? ''),
      ),
      body: Obx(() => moviesCollectionsController
              .moviesCollectionDetailLoaded.value
          ? ListView(
              children: [
                moviesCollectionsController
                            .movieCollectionDetail.value.backdropPath !=
                        null
                    ? ShaderMask(
                        blendMode: BlendMode.dstIn,
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0.0, 0.5, 1],
                          ).createShader(
                            Rect.fromLTRB(0, 1, rect.width, rect.height),
                          );
                        },
                        child: CachedNetworkImage(
                          imageUrl: ApiSettings.imagePath500(
                              moviesCollectionsController
                                  .movieCollectionDetail.value.backdropPath!),
                          width: double.infinity,
                        ),
                      )
                    : Image.asset('assets/image/no_image_backdrop.png'),
                Visibility(
                  visible: moviesCollectionsController
                      .movieCollectionDetail.value.overview!.isNotEmpty,
                  child: Column(
                    children: [
                      const Divider(),
                      Text(moviesCollectionsController
                              .movieCollectionDetail.value.overview ??
                          'asfasfd'),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: moviesCollectionsController
                      .movieCollectionDetail.value.parts!.length,
                  itemBuilder: (context, index) {
                    var result = moviesCollectionsController
                        .movieCollectionDetail.value.parts!;
                    log('collection date format : ${result[index].releaseDate!}');
                    return SizedBox(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: Card(
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: result[index].posterPath != null
                                      ? CachedNetworkImage(
                                          imageUrl: ApiSettings.imagePath500(
                                              result[index].posterPath!),
                                          fit: BoxFit.fill,
                                        )
                                      : Image.asset(
                                          'assets/image/no_image.png'),
                                ),
                                const Gap(5),
                                Container(
                                  // color: Colors.yellow,
                                  width: 250,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Visibility(
                                          visible:
                                              result[index].title!.isNotEmpty,
                                          child: Text(result[index].title!)),
                                      Visibility(
                                          visible: result[index]
                                              .originalTitle!
                                              .isNotEmpty,
                                          child: Text(
                                              result[index].originalTitle!)),
                                      Row(
                                        children: [
                                          Visibility(
                                              visible:
                                                  result[index].voteAverage !=
                                                      null,
                                              child: Text(ApiSettings
                                                  .voteAverageConverter(
                                                      result[index]
                                                          .voteAverage!))),
                                          const Gap(3),
                                          Visibility(
                                              visible:
                                                  result[index].voteCount !=
                                                      null,
                                              child: Text(result[index]
                                                  .voteCount!
                                                  .toString())),
                                        ],
                                      ),
                                      Visibility(
                                          visible: result[index].releaseDate !=
                                                  null &&
                                              result[index]
                                                  .releaseDate!
                                                  .isNotEmpty,
                                          child: Text(
                                            ApiSettings.formatDateString(
                                                result[index]
                                                        .releaseDate!
                                                        .isEmpty
                                                    ? '0000-00-00'
                                                    : result[index]
                                                        .releaseDate!),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                          )),
                                      Visibility(
                                          visible: result[index]
                                              .overview!
                                              .isNotEmpty,
                                          child: Text(
                                            result[index].overview!,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovieDetailPage(
                                          movieId: result[index].id!,
                                          appBar: result[index].title!,
                                          tag: result[index].title!,
                                          backdropUrl:
                                              result[index].backdropPath!,
                                          posterUrl: result[index].posterPath!,
                                        )));
                          },
                        ),
                      ),
                    );
                  },
                )
              ],
            )
          : const SizedBox()),
    );
  }
}
