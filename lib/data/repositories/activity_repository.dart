import 'package:i_am_bored/core/errors/exceptions.dart';
import 'package:i_am_bored/core/network/network_info.dart';
import 'package:i_am_bored/data/datasources/local_datasource.dart';
import 'package:i_am_bored/data/datasources/remote_datasource.dart';
import 'package:i_am_bored/data/models/activity_mode.dart';
import 'package:i_am_bored/domain/entities/activity_entity.dart';
import 'package:i_am_bored/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:i_am_bored/domain/repositories/activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final NetworkInfo networkInfo;
  final ActivityLocalDataSource activityLocalDataSource;
  final ActivityRemoteDatasource activityRemoteDataSource;

  ActivityRepositoryImpl(
      {required this.networkInfo,
      required this.activityLocalDataSource,
      required this.activityRemoteDataSource});

  @override
  Future<Either<Failure, Activity>> getRandomActivity() async {
    try {
      final activity = await activityRemoteDataSource.getRandomActivity();
      return Right(activity);
    } on ServerException {
      return const Left(ServerFailure([]));
    }
  }

  @override
  Future<Either<Failure, List<Activity>>> getSavedActivities() async {
    try {
      return Right(await activityLocalDataSource.getSavedActivities());
    } on ConvertException {
      return const Left(ConvertFailure([]));
    }
  }

  @override
  Future<Either<Failure, void>> deleteActivity(String key) async {
    return Right(await activityLocalDataSource.deleteSavedActivity(key));
  }

  @override
  Future<Either<Failure, void>> saveActivity(ActivityModel activity) async {
    return Right(await activityLocalDataSource.insertActivity(activity));
  }

  @override
  Future<Either<Failure, Activity>> getActivity(String key) async {
    return Right(await activityLocalDataSource.getActivity(key));
  }
}
