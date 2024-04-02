import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class MovieDetailButtonGroupsWidget extends StatelessWidget {
  const MovieDetailButtonGroupsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeInLeft(
              delay: const Duration(milliseconds: 180),
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_active_outlined)),
                  const Text('Hatırlat'),
                ],
              ),
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 240),
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_add_outlined)),
                  const Text('İzleme Listesi'),
                ],
              ),
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 300),
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu_open_rounded)),
                  const Text('Listeye Ekle'),
                ],
              ),
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 360),
              child: Column(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.check)),
                  const Text('İzlendi'),
                ],
              ),
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 420),
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.note_add_outlined)),
                  const Text('Not Tut'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
