// Mocks generated by Mockito 5.3.2 from annotations
// in i_am_bored/test/domain/usecases/get_random_activity_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:i_am_bored/core/errors/failures.dart' as _i5;
import 'package:i_am_bored/data/models/activity_mode.dart' as _i7;
import 'package:i_am_bored/domain/entities/activity_entity.dart' as _i6;
import 'package:i_am_bored/domain/repositories/activity_repository.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ActivityRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockActivityRepository extends _i1.Mock
    implements _i3.ActivityRepository {
  MockActivityRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Activity>> getRandomActivity() =>
      (super.noSuchMethod(
        Invocation.method(
          #getRandomActivity,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Activity>>.value(
            _FakeEither_0<_i5.Failure, _i6.Activity>(
          this,
          Invocation.method(
            #getRandomActivity,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Activity>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Activity>>>
      getSavedActivities() => (super.noSuchMethod(
            Invocation.method(
              #getSavedActivities,
              [],
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.Failure, List<_i6.Activity>>>.value(
                    _FakeEither_0<_i5.Failure, List<_i6.Activity>>(
              this,
              Invocation.method(
                #getSavedActivities,
                [],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Activity>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Activity>> getActivity(String? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #getActivity,
          [key],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Activity>>.value(
            _FakeEither_0<_i5.Failure, _i6.Activity>(
          this,
          Invocation.method(
            #getActivity,
            [key],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Activity>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> deleteActivity(String? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteActivity,
          [key],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #deleteActivity,
            [key],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> saveActivity(
          _i7.ActivityModel? activity) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveActivity,
          [activity],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #saveActivity,
            [activity],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
}
