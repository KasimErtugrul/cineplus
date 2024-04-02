import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineplus/featured_tmdb/movies/presentation/screen/movie_detail_page.dart';
import 'package:flutter/material.dart';

import '../../core/api/api_settings.dart';

class MainScreenMovieCardWidget extends StatelessWidget {
  const MainScreenMovieCardWidget(
      {super.key,
      required this.tag,
      required this.movieId,
      this.posterUrl,
      this.backdropUrl,
      this.title});

  final String? posterUrl;
  final String? backdropUrl;
  final String? title;
  final String tag;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        child: Column(
          children: [
            Hero(
              tag: tag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: posterUrl != null
                    ? CachedNetworkImage(
                        imageUrl: ApiSettings.imagePath500(posterUrl!),
                        height: 200,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Image.network(
                          ApiSettings.imagePath185(posterUrl!),
                          height: 200,
                          fit: BoxFit.fill,
                        ),
                      )
                    : Image.asset(
                        'assets/image/no_image.png',
                        height: 200,
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            SizedBox(
              width: 135,
              child: Text(
                title ?? '',
                style: const TextStyle(fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        onTap: () {
          log('main screen card tag: $tag');

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailPage(
                  posterUrl: posterUrl ?? null,
                  backdropUrl: backdropUrl ?? null,
                  movieId: movieId,
                  appBar: title!,
                  tag: tag,
                ),
              ));
        },
      ),
    );
  }
}
