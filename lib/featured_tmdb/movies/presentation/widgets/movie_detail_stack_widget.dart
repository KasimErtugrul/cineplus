import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../core/api/api_settings.dart';
import '../controller/movies_detail_controller.dart';

class MovieDetailStackWidget extends StatelessWidget {
  final String? posterUrl;
  final String? backdropUrl;
  final String tag;
  final MoviesDetailController moviesDetailController;
  const MovieDetailStackWidget(
      {super.key,
      required this.tag,
      required this.moviesDetailController,
      this.posterUrl,
      this.backdropUrl});

  @override
  Widget build(BuildContext context) {
    log('stack widget tag: $tag');

    return Obx(() => SizedBox(
          height: 400,
          child: Stack(
            children: [
              backdropUrl != null
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
                      child: backdropUrl != null && backdropUrl!.isNotEmpty
                          ? CachedNetworkImage(
                              fadeInDuration: const Duration(seconds: 0),
                              imageUrl: ApiSettings.imagePath500(backdropUrl!),
                              placeholder: (context, _) => Image.network(
                                ApiSettings.imagePath185(backdropUrl!),
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                            )
                          : Image.asset('assets/image/no_image_backdrop.png'),
                    )
                  : Image.asset(
                      'assets/image/no_image_backdrop.png',
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
              Positioned(
                top: 150,
                left: 20,
                child: Hero(
                  tag: 'deneme',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: posterUrl != null
                        ? CachedNetworkImage(
                            fadeInDuration: const Duration(seconds: 0),
                            imageUrl: ApiSettings.imagePath500(posterUrl!),
                            height: 200,
                            placeholder: (context, _) => Image.network(
                              ApiSettings.imagePath185(posterUrl!),
                              fit: BoxFit.fill,
                              // width: double.infinity,
                            ),
                          )
                        : Image.asset(
                            'assets/image/no_image.png',
                            height: 200,
                          ),
                  ),
                ),
              ),
              Positioned(
                top: 240,
                left: 170,
                child: SizedBox(
                  width: 220,
                  child: moviesDetailController.moviesDetailLoading.value
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInRight(
                              delay: const Duration(milliseconds: 60),
                              child: Text(
                                moviesDetailController
                                        .moviesDetailData.value.title ??
                                    '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            FadeInRight(
                              delay: const Duration(milliseconds: 80),
                              child: Text(
                                moviesDetailController
                                    .moviesDetailData.value.originalTitle!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            FadeInRight(
                              delay: const Duration(milliseconds: 100),
                              child: Visibility(
                                visible: moviesDetailController.moviesDetailData
                                            .value.releaseDate !=
                                        null &&
                                    moviesDetailController.moviesDetailData
                                        .value.releaseDate!.isNotEmpty,
                                child: Text(
                                  ApiSettings.formatDateString(
                                      moviesDetailController.moviesDetailData
                                              .value.releaseDate!.isEmpty
                                          ? '0000-00-00'
                                          : moviesDetailController
                                              .moviesDetailData
                                              .value
                                              .releaseDate!),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                FadeInRight(
                                  delay: const Duration(milliseconds: 120),
                                  child: Container(
                                    width: 100,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            '${ApiSettings.voteAverageConverter((moviesDetailController.moviesDetailData.value.voteAverage!))} | ${moviesDetailController.moviesDetailData.value.voteCount.toString()}'),
                                        const Icon(
                                          Icons.people,
                                          size: 17,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                FadeInRight(
                                  delay: const Duration(milliseconds: 140),
                                  child: Container(
                                    width: 100,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Center(
                                      child: Text(
                                        ApiSettings.dakikaDonusumu(
                                            moviesDetailController
                                                .moviesDetailData
                                                .value
                                                .runtime!),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : const SizedBox(),
                ),
              ),
              moviesDetailController.moviesDetailLoading.value
                  ? Positioned(
                      top: 360,
                      left: 10,
                      child: SizedBox(
                        height: 25,
                        width: 380,
                        child: FadeInLeft(
                          delay: const Duration(milliseconds: 160),
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Text(
                                moviesDetailController.moviesDetailData.value
                                    .genres![index].name!,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const VerticalDivider(),
                            itemCount: moviesDetailController
                                .moviesDetailData.value.genres!.length,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ));
  }
}
