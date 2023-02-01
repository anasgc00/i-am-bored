import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_am_bored/domain/entities/activity_entity.dart';
import 'package:i_am_bored/domain/repositories/activity_repository.dart';
import 'package:i_am_bored/domain/usecases/get_random_activity_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_random_activity_usecase_test.mocks.dart';

@GenerateMocks([ActivityRepository])
void main() {
  final mockedRepo = MockActivityRepository();
  final GetRandomActivityUseCase usecase = GetRandomActivityUseCase(mockedRepo);
  final Activity tActivity = Activity(
      activity: 'test',
      type: 'test',
      participants: 1,
      key: '5321',
      price: 1,
      accessibility: 0);

  test('should get a random activity from the activity repo', () async {
    //arrange
    when(mockedRepo.getRandomActivity())
        .thenAnswer((realInvocation) async => Right(tActivity));
    //act
    final result = await usecase.call('');
    //assert
    expect(result, Right(tActivity));
    verify(mockedRepo.getRandomActivity());
  });
}
