import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../data/models/activity_mode.dart';
import '../entities/activity_entity.dart';

abstract class ActivityRepository {
  Future<Either<Failure, Activity>> getRandomActivity();

  Future<Either<Failure, List<Activity>>> getSavedActivities();

  Future<Either<Failure, Activity>> getActivity(String key);

  Future<Either<Failure, void>> deleteActivity(String key);

  Future<Either<Failure, void>> saveActivity(ActivityModel activity);
}
