// Mocks generated by Mockito 5.3.2 from annotations
// in ditonton/test/presentation/provider/television/top_rated_shows_notifier_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:ditonton/common/failure.dart' as _i6;
import 'package:ditonton/domain/entities/television.dart' as _i7;
import 'package:ditonton/domain/repositories/television_repository.dart' as _i2;
import 'package:ditonton/domain/usecases/television/get_top_rated_shows.dart'
    as _i4;
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

class _FakeTelevisionRepository_0 extends _i1.SmartFake
    implements _i2.TelevisionRepository {
  _FakeTelevisionRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetTopRatedShows].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTopRatedShows extends _i1.Mock implements _i4.GetTopRatedShows {
  @override
  _i2.TelevisionRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTelevisionRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeTelevisionRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TelevisionRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Television>>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.Television>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.Television>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.Television>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.Television>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.Television>>>);
}
