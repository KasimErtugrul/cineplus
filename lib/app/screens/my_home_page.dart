import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineplus/core/api/api_settings.dart';
import 'package:cineplus/core/resources/string_manager.dart';
import 'package:cineplus/featured_tmdb/list/presentation/controller/list_controller.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';

import '../../featured_tmdb/movie_lists/presentation/controller/movie_list_controller.dart';
import '../../featured_tmdb/movie_lists/presentation/widgets/movlie_list_now_playing_widget.dart';
import '../../featured_tmdb/movie_lists/presentation/widgets/movlie_list_popular_widget.dart';
import '../../featured_tmdb/movie_lists/presentation/widgets/movlie_list_top_rated_widget.dart';
import '../../featured_tmdb/movie_lists/presentation/widgets/movlie_list_up_coming_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StoryController controller = StoryController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MovieListController movieListController = Get.find();
    final ListController listController = Get.find()
      ..fetchListDetail(listId: 8281634);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CinePlus'),
      ),
      body: Obx(() => ConditionalBuilder(
            condition: movieListController.nowPlayingLoading.value &&
                movieListController.popularLoading.value &&
                movieListController.upComingLoading.value &&
                movieListController.topRatedLoading.value,
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView(
                children: [
                  //
                  Obx(
                    () => listController.listDetailLoaded.value
                        ? Container(
                            height: 300,
                            child: StoryView(
                              repeat: true,
                              controller: controller,
                              storyItems: [
                                // Listeyi döngüye alarak her öğe için bir StoryItem oluşturun
                                ...listController.listDetailData.value.items!
                                    .map(
                                  (item) {
                                    return StoryItem.pageImage(
                                      imageFit: BoxFit.fill,
                                      loadingWidget: CachedNetworkImage(
                                          imageUrl: ApiSettings.imagePath185(
                                              item.backdropPath!)),
                                      url: ApiSettings.imagePath500(
                                          item.backdropPath!),
                                      controller: controller,
                                      caption: Text(
                                        item.title!,
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    );
                                  },
                                ),
                              ],
                              onStoryShow: (storyItem, index) {
                                log('showing a story');
                              },
                            ),
                          )
                        : const SizedBox(),
                  ),
                  Text(StringManager.nowPlayingMovies),
                  const MovieListNowPlayingWidget(),
                  const Gap(10),
                  Text(StringManager.popularMovies),
                  const MovieListPopularWidget(),
                  const Gap(10),
                  Text(StringManager.topRatedMovies),
                  const MovieListTopRatedWidget(),
                  const Gap(10),
                  Text(StringManager.upComingMovies),
                  const MovieListUpComingWidget(),
                ],
              ),
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          )),
    );
  }
}
