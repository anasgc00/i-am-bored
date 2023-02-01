import 'package:i_am_bored/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:i_am_bored/core/usecases/usecase.dart';
import 'package:i_am_bored/domain/entities/activity_entity.dart';
import 'package:i_am_bored/domain/repositories/activity_repository.dart';

class GetSavedActivitiesUseCase implements UseCase {
  final ActivityRepository repository;

  GetSavedActivitiesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Activity>>> call(params) {
    return repository.getSavedActivities();
  }
}
