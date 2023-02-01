import 'package:i_am_bored/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:i_am_bored/core/usecases/usecase.dart';
import 'package:i_am_bored/domain/repositories/activity_repository.dart';

class DeleteActivityUseCase extends UseCase {
  final ActivityRepository repository;

  DeleteActivityUseCase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return repository.deleteActivity(params);
  }
}
