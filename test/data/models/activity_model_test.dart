import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:i_am_bored/core/errors/exceptions.dart';
import 'package:i_am_bored/data/models/activity_mode.dart';
import 'package:i_am_bored/domain/entities/activity_entity.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tModel = ActivityModel(
      activity: 'test',
      type: 'test',
      participants: 1,
      key: '5321',
      price: 1,
      accessibility: 0);

  test('should be a subclass of Activity', () {
    expect(tModel, isA<Activity>());
  });

  group('toJson', () {
    test('should return a jsonMap with the valid data', () {
      //act
      final jsonMap = tModel.toJson();
      final expectedMap = {
        'activityName': 'test',
        'type': 'test',
        'participants': 1,
        'key': '5321',
        'price': 1,
        'accesibility': 0
      };
      //assert
      expect(jsonMap, equals(expectedMap));
    });
  });

  group('from Json', () {
    test('should return a ActivityModel with valid data from the json', () {
      //act
      final jsonMap = jsonDecode(fixtureReader('activity.json'));
      final result = ActivityModel.fromJson(jsonMap);
      //assert
      expect(result, equals(tModel));
    });
  });
}
