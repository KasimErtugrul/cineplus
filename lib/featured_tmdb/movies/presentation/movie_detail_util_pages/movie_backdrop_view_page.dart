import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineplus/core/api/api_settings.dart';
import 'package:cineplus/featured_tmdb/movies/presentation/controller/movies_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieBackdropViewPage extends StatelessWidget {
  final MoviesDetailController moviesDetailController;
  final String appBar;
  final String heroTag;
  const MovieBackdropViewPage(
      {super.key,
      required this.moviesDetailController,
      required this.appBar,
      required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$appBar Arka Plan Resimleri'),
        ),
        body: Obx(() => moviesDetailController.moviesDetailImageLoading.value
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 300,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemCount: moviesDetailController
                    .moviesDetailImagesData.value.backdrops!.length,
                itemBuilder: (context, index) {
                  var result = moviesDetailController
                      .moviesDetailImagesData.value.backdrops!;
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
