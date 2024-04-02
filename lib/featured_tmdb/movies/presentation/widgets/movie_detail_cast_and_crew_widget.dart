import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineplus/app/utils/app_util.dart';
import 'package:cineplus/featured_tmdb/movies/presentation/controller/movies_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/utils/enums.dart';
import '../../../../core/api/api_settings.dart';

class MovieDetailCastAndCrewWidget extends StatelessWidget {
  final MoviesDetailController moviesDetailController;
  const MovieDetailCastAndCrewWidget(
      {super.key, required this.moviesDetailController});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Obx(
      () => moviesDetailController.moviesDetailLoading.value
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: Text('Cast')),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          moviesDetailController.castEnum(CastEnum.cast);
                        },
                        child: Text(
                          'Oyuncular',
                          style: TextStyle(
                              color: moviesDetailController.castEnum.value ==
                                      CastEnum.cast
                                  ? Colors.blue
                                  : Colors.red,
                              fontSize: moviesDetailController.castEnum.value ==
                                      CastEnum.cast
                                  ? 15
                                  : 12),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            moviesDetailController.castToCrew(CastEnum.crew);
                          },
                          child: Text(
                            'Yapım Ekibi',
                            style: TextStyle(
                                color: moviesDetailController.castEnum.value ==
                                        CastEnum.crew
                                    ? Colors.blue
                                    : Colors.red,
                                fontSize:
                                    moviesDetailController.castEnum.value ==
                                            CastEnum.crew
                                        ? 15
                                        : 12),
                          )),
                    ],
                  ),
                  if (moviesDetailController.castEnum.value == CastEnum.cast)
                    SizedBox(
                      height: height * .25,
                      child: moviesDetailController
                                  .moviesDetailData.value.credits!.cast !=
                              null
                          ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: moviesDetailController
                                  .moviesDetailData.value.credits!.cast!.length,
                              itemBuilder: (context, index) {
                                var result = moviesDetailController
                                    .moviesDetailData.value.credits!.cast!;
                                return FadeIn(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: SizedBox(
                                      width: width * .30,
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: result[index].profilePath !=
                                                    null
                                                ? CachedNetworkImage(
                                                    imageUrl: ApiSettings
                                                        .imagePath500(
                                                            result[index]
                                                                .profilePath!),
                                                    height: height * .15,
                                                  )
                                                : Image.asset(
                                                    'assets/image/no_person.png',
                                                    height: height * .15,
                                                  ),
                                          ),
                                          AutoSizeText(
                                              textAlign: TextAlign.center,
                                              result[index].name ?? ''),
                                          AutoSizeText(
                                            textAlign: TextAlign.center,
                                            result[index].character ?? '',
                                            style: const TextStyle(
                                                color: Colors.red),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : const SizedBox(),
                    )
                  else
                    SizedBox(
                      height: height * .30,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: moviesDetailController
                            .moviesDetailData.value.credits!.crew!.length,
                        itemBuilder: (context, index) {
                          var result = moviesDetailController
                              .moviesDetailData.value.credits!.crew!;
                          return FadeIn(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: SizedBox(
                                width: width * .30,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: result[index].profilePath != null
                                          ? CachedNetworkImage(
                                              imageUrl:
                                                  ApiSettings.imagePath500(
                                                      result[index]
                                                          .profilePath!),
                                              height: height * .15,
                                            )
                                          : Image.asset(
                                              'assets/image/no_person.png',
                                              height: height * .15,
                                            ),
                                    ),
                                    AutoSizeText(
                                        textAlign: TextAlign.center,
                                        result[index].name ?? ''),
                                    FutureBuilder<String?>(
                                      future: AppUtil.getJobTranslation(
                                          result[index].department!,
                                          result[index]
                                              .job!), // Örnek departman ve iş adı
                                      builder: (BuildContext context,
                                          AsyncSnapshot<String?> snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const SizedBox.shrink();
                                        } else {
                                          if (snapshot.hasData) {
                                            return AutoSizeText(
                                              snapshot.data ?? '',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Colors.red),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            );
                                          } else if (snapshot.hasError) {
                                            return Text(
                                                'Hata: ${snapshot.error}');
                                          } else {
                                            return const Text(
                                                'Veri bulunamadı.');
                                          }
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            )
          : SizedBox(),
    );
  }
}
