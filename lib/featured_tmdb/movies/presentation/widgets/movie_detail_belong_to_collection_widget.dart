import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineplus/featured_tmdb/collections/presentation/screen/movie_collection_view_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/api/api_settings.dart';
import '../controller/movies_detail_controller.dart';

class MovieDetailBelongsToCollectionWidget extends StatelessWidget {
  const MovieDetailBelongsToCollectionWidget({
    super.key,
    required this.appBar,
    required this.moviesDetailController,
  });

  final String appBar;
  final MoviesDetailController moviesDetailController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$appBar Filminin Koleksiyonları'),
          CachedNetworkImage(
            imageUrl: ApiSettings.imagePath500(moviesDetailController
                .moviesDetailData.value.belongsToCollection!.backdropPath!),
            width: double.infinity,
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieCollectionViewPage(
                collectionId: moviesDetailController
                    .moviesDetailData.value.belongsToCollection!.id!,
              ),
            ));
      },
    );
  }
}
