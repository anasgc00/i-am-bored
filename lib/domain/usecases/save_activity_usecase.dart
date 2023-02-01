import 'package:i_am_bored/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:i_am_bored/core/usecases/usecase.dart';
import 'package:i_am_bored/domain/repositories/activity_repository.dart';

class SaveActivityUseCase implements UseCase {
  final ActivityRepository repository;

  SaveActivityUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(params) {
    return repository.saveActivity(params);
  }
}
