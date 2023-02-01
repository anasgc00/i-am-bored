import 'package:dio/dio.dart';
import 'package:i_am_bored/core/errors/exceptions.dart';
import 'package:i_am_bored/data/models/activity_mode.dart';

import '../../core/retrofit_client/api_client.dart';
import '../../domain/entities/activity_entity.dart';

abstract class ActivityRemoteDatasource {
  Future<Activity> getRandomActivity();
}

class ActivityRemoteDataSourceImpl implements ActivityRemoteDatasource {
  final ApiClient apiClient;

  ActivityRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<Activity> getRandomActivity() async {
    try {
      return await apiClient.getRandomActivity();
    } on DioError {
      throw ServerException();
    }
  }
}
