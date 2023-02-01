import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_am_bored/core/errors/exceptions.dart';
import 'package:i_am_bored/core/errors/failures.dart';
import 'package:i_am_bored/core/network/network_info.dart';
import 'package:i_am_bored/data/datasources/local_datasource.dart';
import 'package:i_am_bored/data/datasources/remote_datasource.dart';
import 'package:i_am_bored/data/models/activity_mode.dart';
import 'package:i_am_bored/data/repositories/activity_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../fixtures/fixture_reader.dart';
import 'activity_repository_impl_test.mocks.dart';

@GenerateMocks(
    [ActivityLocalDataSource, ActivityRemoteDataSourceImpl, NetworkInfo])
void main() {
  final mockedRemote = MockActivityRemoteDataSourceImpl();
  final mockedLocal = MockActivityLocalDataSource();
  final mockedNInfo = MockNetworkInfo();
  final repoImpl = ActivityRepositoryImpl(
      networkInfo: mockedNInfo,
      activityLocalDataSource: mockedLocal,
      activityRemoteDataSource: mockedRemote);

  final tActivity =
      ActivityModel.fromJson(jsonDecode(fixtureReader('activity.json')));

  group('get random activity', () {
    test('should return a valid Activity from the api', () async {
      when(mockedNInfo.isConnected).thenAnswer((realInvocation) async => true);
      when(mockedRemote.getRandomActivity())
          .thenAnswer((realInvocation) async => tActivity);

      final result = await repoImpl.getRandomActivity();

      expect(result, Right(tActivity));
    });

    test('should return a serverFailure when the device is offline', () async {
      //arrange
      when(mockedRemote.getRandomActivity()).thenThrow(ServerException());
      when(mockedNInfo.isConnected).thenAnswer((realInvocation) async => false);
      //act
      final result = await repoImpl.getRandomActivity();
      //assert
      expect(result, const Left(ServerFailure([])));
    });
  });

  group('get saved activities', () {
    reset(mockedLocal);
    reset(mockedRemote);
    reset(mockedNInfo);

    test('should return a list of activities from the local data source',
        () async {
      //arrange
      when(mockedLocal.getSavedActivities())
          .thenAnswer((realInvocation) async => [tActivity]);
      //act
      final result = await repoImpl.getSavedActivities();
      final expected = Right([tActivity]).toIterable().toList();
      //assert
      expect(result.toIterable().toList().first, expected.first);
    });

    test('should return Left(ConvertFailure)', () async {
      //arrange
      when(mockedLocal.getSavedActivities()).thenThrow(ConvertException());
      //act
      final result = await repoImpl.getSavedActivities();
      //assert
      expect(result, const Left(ConvertFailure([])));
    });
  });
}
