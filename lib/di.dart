import 'package:cineplus/featured_tmdb/list/data/datasource/list_remote_datasource.dart';
import 'package:cineplus/featured_tmdb/list/data/datasource/remote/list_remote.dart';
import 'package:cineplus/featured_tmdb/list/data/repository_imp/list_repository_imp.dart';
import 'package:cineplus/featured_tmdb/list/domain/repository/list_repository.dart';
import 'package:cineplus/featured_tmdb/list/domain/usecase/list_detail_usecase.dart';
import 'package:cineplus/featured_tmdb/list/presentation/controller/list_controller.dart';
import 'package:cineplus/featured_tmdb/movie_lists/data/datasource/movie_list_remote_datasource.dart';
import 'package:cineplus/featured_tmdb/movie_lists/data/repository_imp/repository_imp.dart';
import 'package:cineplus/featured_tmdb/movie_lists/domain/repository/repository.dart';
import 'package:cineplus/featured_tmdb/movie_lists/presentation/controller/movie_list_controller.dart';

import 'package:cineplus/featured_tmdb/movies/data/datasource/movies_detail_remote_datasource.dart';
import 'package:cineplus/featured_tmdb/movies/data/datasource/remote/movies_detail_remote.dart';
import 'package:cineplus/featured_tmdb/movies/domain/repository/movies_detail_repository.dart';
import 'package:cineplus/featured_tmdb/movies/domain/usecase/movies_detail_images_usecase.dart';
import 'package:cineplus/featured_tmdb/movies/domain/usecase/movies_detail_usecase.dart';
import 'package:cineplus/featured_tmdb/movies/domain/usecase/movies_detail_watch_provider_usecase.dart';
import 'package:cineplus/featured_tmdb/movies/presentation/controller/movies_detail_controller.dart';
import 'package:cineplus/featured_tmdb/search/data/datasource/remote/search_remote.dart';
import 'package:cineplus/featured_tmdb/search/data/repository_imp/search_repository_imp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'featured_tmdb/collections/data/datasource/movies_collection_remote_datasource.dart';
import 'featured_tmdb/collections/data/datasource/remote/movies_collection_remote.dart';
import 'featured_tmdb/collections/data/repository_imp/movies_collection_repository_imp.dart';
import 'featured_tmdb/collections/domain/repository/movies_collection_repository.dart';
import 'featured_tmdb/collections/domain/usecase/movies_collection_detail_usecase.dart';
import 'featured_tmdb/collections/presentation/controller/movies_collections_controller.dart';
import 'featured_tmdb/movie_lists/data/datasource/remote/movie_lists_remote.dart';
import 'featured_tmdb/movie_lists/domain/usecase/movie_list_nowplaying_usecase.dart';
import 'featured_tmdb/movie_lists/domain/usecase/movie_list_popular_usecase.dart';
import 'featured_tmdb/movie_lists/domain/usecase/movie_list_toprated_usecase.dart';
import 'featured_tmdb/movie_lists/domain/usecase/movie_lists_upcoming_usecases.dart';
import 'featured_tmdb/movies/data/repository_imp/movies_detail_repository_imp.dart';
import 'featured_tmdb/search/data/datasource/search_remote_datasource.dart';
import 'featured_tmdb/search/domain/repository/search_repostitory.dart';
import 'featured_tmdb/search/domain/usecase/search_person_usecase.dart';

void setupLocator() {
  Get.lazyPut<MovieListsRemote>(() => MovieListsRemote(), fenix: true);
  Get.lazyPut<MovieListRemoteDatasource>(() => MovieListRemoteDatasourceImp(),
      fenix: true);
  Get.lazyPut<MovieListRepository>(() => MovieListsRepositoryImp(),
      fenix: true);
  Get.lazyPut<MovieListNowPlayingUsecase>(() => MovieListNowPlayingUsecase(),
      fenix: true);
  Get.lazyPut<MovieListPopularUsecase>(() => MovieListPopularUsecase(),
      fenix: true);
  Get.lazyPut<MovieListTopRatedUsecase>(() => MovieListTopRatedUsecase(),
      fenix: true);
  Get.lazyPut<MovieListUpComingUsecase>(() => MovieListUpComingUsecase(),
      fenix: true);

  // Controller
  Get.put<MovieListController>(
      MovieListController()
        ..fetchNowPlayingController()
        ..fetchPopularController()
        ..fetchTopRatedController()
        ..fetchUpComingController(),
      permanent: true);
// Movies Detail
 // Get.putAsync(() => GetStorage.init());
  Get.lazyPut<MoviesDetailRemote>(() => MoviesDetailRemote(), fenix: true);
 
  Get.lazyPut<MoviesDetailRemoteDatasource>(
      () => MoviesDetailRemoteDatasourceImp(),
      fenix: true);
 
  Get.lazyPut<MoviesDetailRepository>(() => MoviesDetailRepositoryImp(),
      fenix: true);

  Get.lazyPut<MoviesDetailUsecase>(() => MoviesDetailUsecase(), fenix: true);

  Get.lazyPut<MoviesDetailImagesUsecase>(() => MoviesDetailImagesUsecase(),
      fenix: true);
  //
  Get.lazyPut<MoviesDetailWatchProviderUsecase>(
      () => MoviesDetailWatchProviderUsecase(),
      fenix: true);

  Get.put<MoviesDetailController>(MoviesDetailController(),
      tag: 'moviesDetail');
  Get.create<MoviesDetailController>(() => MoviesDetailController());

  // Movies Collections
  Get.lazyPut<MoviesCollectionRemote>(() => MoviesCollectionRemote(),
      fenix: true);
  Get.lazyPut<MoviesCollectionRemoteDatasource>(
      () => MoviesCollectionRemoteDataSourceImpl(),
      fenix: true);
  Get.lazyPut<MoviesCollectionRepository>(() => MoviesCollectionRepositoryImp(),
      fenix: true);
  Get.lazyPut<MoviesCollectionDetailUsecase>(
      () => MoviesCollectionDetailUsecase(),
      fenix: true);
  Get.put<MoviesCollectionsController>(
    MoviesCollectionsController(),
    tag: 'movie_collections',
  );
  Get.create<MoviesCollectionsController>(() => MoviesCollectionsController());

  // List
  Get.lazyPut<ListRemote>(() => ListRemote(), fenix: true);
  Get.lazyPut<ListRemoteDatasource>(() => ListRemoteDatasourceImp(),
      fenix: true);
  Get.lazyPut<ListRepository>(() => ListRepositoryImp(), fenix: true);
  Get.lazyPut<ListDetailUsecase>(() => ListDetailUsecase(), fenix: true);
  Get.put<ListController>(
    ListController(),
    tag: 'list',
  );
  Get.create<ListController>(() => ListController());

  // Search
  Get.lazyPut<SearchRemote>(() => SearchRemote(), fenix: true);
  Get.lazyPut<SearchRemoteDatasource>(() => SearchRemoteDatasourceImp(),
      fenix: true);
  Get.lazyPut<SearchRepository>(() => SearchRepositoryImp(), fenix: true);
  Get.lazyPut<SearchPersonUsecase>(() => SearchPersonUsecase(), fenix: true);
  Get.put<SearchController>(
    SearchController(),
    tag: 'search',
  );
  Get.create<SearchController>(() => SearchController());
}
