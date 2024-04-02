import 'package:equatable/equatable.dart';

class MoviesWatchProviderEntity extends Equatable {
  final int? id;
  final MoviesWatchProviderResultsEntity? results;

  const MoviesWatchProviderEntity({
    this.id,
    this.results,
  });

  @override
  List<Object?> get props => [id, results];
}

class MoviesWatchProviderResultsEntity {
  final MoviesWatchProviderTrEntity? tr;

  MoviesWatchProviderResultsEntity({
    this.tr,
  });
}

class MoviesWatchProviderTrEntity extends Equatable {
  final String? link;
  final List<MoviesWatchProviderBuyEntity>? flatrate;
  final List<MoviesWatchProviderBuyEntity>? buy;
  final List<MoviesWatchProviderBuyEntity>? rent;

  const MoviesWatchProviderTrEntity({
    this.link,
    this.flatrate,
    this.buy,
    this.rent,
  });

  @override
  List<Object?> get props => [link, flatrate, buy, rent];
}

class MoviesWatchProviderBuyEntity extends Equatable {
  final String? logoPath;
  final int? providerId;
  final String? providerName;
  final int? displayPriority;

  const MoviesWatchProviderBuyEntity({
    this.logoPath,
    this.providerId,
    this.providerName,
    this.displayPriority,
  });

  @override
  List<Object?> get props =>
      [logoPath, providerId, providerName, displayPriority];
}
