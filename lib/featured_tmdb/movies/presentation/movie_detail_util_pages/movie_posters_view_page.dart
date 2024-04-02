import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineplus/core/api/api_settings.dart';
import 'package:cineplus/featured_tmdb/movies/presentation/controller/movies_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviePostersViewPage extends StatelessWidget {
  final MoviesDetailController moviesDetailController;
  final String appBar;
  final String heroTag;
  const MoviePostersViewPage(
      {super.key,
      required this.moviesDetailController,
      required this.appBar,
      required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$appBar Posterleri'),
        ),
        body: Obx(() => moviesDetailController.moviesDetailImageLoading.value
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 300,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemCount: moviesDetailController
                    .moviesDetailImagesData.value.posters!.length,
                itemBuilder: (context, index) {
                  var result = moviesDetailController
                      .moviesDetailImagesData.value.posters!;
                  return CachedNetworkImage(
                    fadeInDuration: const Duration(milliseconds: 0),
                    imageUrl:
                        ApiSettings.imagePathOriginal(result[index].filePath!),
                    // height: 180,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Image.network(
                      ApiSettings.imagePath185(
                        result[index].filePath!,
                      ),
                      // height: 150,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              )
            : const SizedBox()));
  }
}
