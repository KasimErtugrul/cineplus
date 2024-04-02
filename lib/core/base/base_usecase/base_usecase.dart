import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../error/failure_request.dart';

abstract class BaseUseCase<T, Parameter> {
  Future<Either<Failure, T>> call(Parameter parameter);
}

abstract class BaseLocalUseCase<T, Parameter> {
  Either<Failure, T> call(Parameter parameter);
}

abstract class BaseUseCaseFirebase<T, P, Y> {
  Future<Either<Failure, T>> call(P parameter, Y parameter2);
}

class NoParameter extends Equatable {
  const NoParameter();

  @override
  List<Object?> get props => [];
}
