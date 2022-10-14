// Mocks generated by Mockito 5.3.2 from annotations
// in ditonton/test/presentation/provider/television/show_detail_notifier_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:ditonton/common/failure.dart' as _i6;
import 'package:ditonton/domain/entities/television.dart' as _i9;
import 'package:ditonton/domain/entities/television_detail.dart' as _i7;
import 'package:ditonton/domain/repositories/television_repository.dart' as _i2;
import 'package:ditonton/domain/usecases/television/get_show_detail.dart'
    as _i4;
import 'package:ditonton/domain/usecases/television/get_show_recommendations.dart'
    as _i8;
import 'package:ditonton/domain/usecases/television/get_television_watchlist_status.dart'
    as _i10;
import 'package:ditonton/domain/usecases/television/television_delete_watchlist.dart'
    as _i12;
import 'package:ditonton/domain/usecases/television/television_save_watchlist.dart'
    as _i11;
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

/// A class which mocks [GetShowDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetShowDetail extends _i1.Mock implements _i4.GetShowDetail {
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
  _i5.Future<_i3.Either<_i6.Failure, _i7.TelevisionDetail>> call(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [id],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, _i7.TelevisionDetail>>.value(
                _FakeEither_1<_i6.Failure, _i7.TelevisionDetail>(
          this,
          Invocation.method(
            #call,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, _i7.TelevisionDetail>>.value(
                _FakeEither_1<_i6.Failure, _i7.TelevisionDetail>(
          this,
          Invocation.method(
            #call,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.TelevisionDetail>>);
}

/// A class which mocks [GetShowRecommendations].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetShowRecommendations extends _i1.Mock
    implements _i8.GetShowRecommendations {
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
  _i5.Future<_i3.Either<_i6.Failure, List<_i9.Television>>> call(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [id],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i9.Television>>>.value(
                _FakeEither_1<_i6.Failure, List<_i9.Television>>(
          this,
          Invocation.method(
            #call,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, List<_i9.Television>>>.value(
                _FakeEither_1<_i6.Failure, List<_i9.Television>>(
          this,
          Invocation.method(
            #call,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i9.Television>>>);
}

/// A class which mocks [GetTelevisionWatchlistStatus].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTelevisionWatchlistStatus extends _i1.Mock
    implements _i10.GetTelevisionWatchlistStatus {
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
  _i5.Future<bool> call(int? id) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [id],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [TelevisionSaveWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockTelevisionSaveWatchlist extends _i1.Mock
    implements _i11.TelevisionSaveWatchlist {
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
  _i5.Future<_i3.Either<_i6.Failure, String>> call(
          _i7.TelevisionDetail? televisionDetail) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [televisionDetail],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, String>>.value(
            _FakeEither_1<_i6.Failure, String>(
          this,
          Invocation.method(
            #call,
            [televisionDetail],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, String>>.value(
                _FakeEither_1<_i6.Failure, String>(
          this,
          Invocation.method(
            #call,
            [televisionDetail],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, String>>);
}

/// A class which mocks [TelevisionDeleteWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockTelevisionDeleteWatchlist extends _i1.Mock
    implements _i12.TelevisionDeleteWatchlist {
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
  _i5.Future<_i3.Either<_i6.Failure, String>> call(
          _i7.TelevisionDetail? televisionDetail) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [televisionDetail],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, String>>.value(
            _FakeEither_1<_i6.Failure, String>(
          this,
          Invocation.method(
            #call,
            [televisionDetail],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, String>>.value(
                _FakeEither_1<_i6.Failure, String>(
          this,
          Invocation.method(
            #call,
            [televisionDetail],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, String>>);
}
