import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_am_bored/core/errors/exceptions.dart';
import 'package:i_am_bored/core/retrofit_client/api_client.dart';
import 'package:i_am_bored/data/datasources/remote_datasource.dart';
import 'package:i_am_bored/data/models/activity_mode.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_reader.dart';
import 'remote_datasource_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  final mockedApiClient = MockApiClient();
  final remoteDataSource =
      ActivityRemoteDataSourceImpl(apiClient: mockedApiClient);

  final tActivity =
      ActivityModel.fromJson(jsonDecode(fixtureReader('activity.json')));

  group('get random activity', () {
    test('should perform a @GET on /activity', () {
      //arrange
      when(mockedApiClient.getRandomActivity())
          .thenAnswer((realInvocation) async => tActivity);
      //act
      remoteDataSource.getRandomActivity();
      //assert
      verify(mockedApiClient.getRandomActivity());
      verifyNoMoreInteractions(mockedApiClient);
    });

    test('should return a valid ActivityModel', () async {
      //arrange
      when(mockedApiClient.getRandomActivity())
          .thenAnswer((realInvocation) async => tActivity);
      //act
      final result = await remoteDataSource.getRandomActivity();
      //assert
      expect(result, tActivity);
    });

    test('should return ServerException when there is a failure on the call',
        () async {
      //arrange
      when(mockedApiClient.getRandomActivity()).thenThrow(
          DioError(requestOptions: RequestOptions(baseUrl: '', path: '')));
      //act
      final result = remoteDataSource.getRandomActivity;
      //assert
      expect(() => result(), throwsA(isA<ServerException>()));
    });
  });
}
