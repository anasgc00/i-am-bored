import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../../data/models/activity_mode.dart';
import '../../domain/entities/activity_entity.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://www.boredapi.com/api/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/activity")
  Future<ActivityModel> getRandomActivity();
}
