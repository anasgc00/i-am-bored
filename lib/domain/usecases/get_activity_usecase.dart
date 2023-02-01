import 'package:i_am_bored/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:i_am_bored/core/usecases/usecase.dart';
import 'package:i_am_bored/domain/repositories/activity_repository.dart';

class GetActivityUseCase implements UseCase {
  final ActivityRepository repository;

  GetActivityUseCase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return repository.getActivity(params);
  }
}
