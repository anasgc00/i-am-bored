import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_am_bored/domain/entities/activity_entity.dart';
import 'package:i_am_bored/domain/usecases/get_saved_activities_usecase.dart';
import 'package:mockito/mockito.dart';

import 'get_random_activity_usecase_test.mocks.dart';

void main() {
  final mockedRepo = MockActivityRepository();
  final getSavedActivityUseCase = GetSavedActivitiesUseCase(mockedRepo);
  final List<Activity> tListActivities = [];

  test('should return a list of the saved activities', () async {
    when(mockedRepo.getSavedActivities())
        .thenAnswer((realInvocation) async => Right(tListActivities));

    final result = await getSavedActivityUseCase('');

    expect(result, Right(tListActivities));
  });
}
