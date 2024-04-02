import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../controller/movies_detail_controller.dart';

class MovieDetailOverviewWidget extends StatelessWidget {
  const MovieDetailOverviewWidget({
    super.key,
    required this.moviesDetailController,
  });

  final MoviesDetailController moviesDetailController;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: const Duration(milliseconds: 540),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Özet'),
          Text(moviesDetailController.moviesDetailData.value.overview!),
        ],
      ),
    );
  }
}
