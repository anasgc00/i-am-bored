import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/activity_entity.dart';

abstract class ActivityRepository {
  Future<Either<Failure, Activity>> getRandomActivity();
}
