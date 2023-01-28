import 'package:i_am_bored/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:i_am_bored/core/usecases/usecase.dart';
import 'package:i_am_bored/domain/entities/activity_entity.dart';
import 'package:i_am_bored/domain/repositories/activity_repository.dart';

class GetRandomActivityUseCase implements UseCase {
  final ActivityRepository repository;

  GetRandomActivityUseCase(this.repository);

  @override
  Future<Either<Failure, Activity>> call(params) {
    return repository.getRandomActivity();
  }
}
