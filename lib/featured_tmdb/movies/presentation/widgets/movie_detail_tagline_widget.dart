import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../controller/movies_detail_controller.dart';

class MovieDetailTaglineWidget extends StatelessWidget {
  const MovieDetailTaglineWidget({
    super.key,
    required this.moviesDetailController,
  });

  final MoviesDetailController moviesDetailController;

  @override
  Widget build(BuildContext context) {
    return FadeInLeftBig(
      delay: const Duration(milliseconds: 480),
      child: Text(
        moviesDetailController.moviesDetailData.value.tagline!,
        style: const TextStyle(fontStyle: FontStyle.italic),
      ),
    );
  }
}
