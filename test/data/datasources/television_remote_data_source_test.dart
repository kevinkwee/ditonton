// ignore_for_file: constant_identifier_names

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/television_remote_data_source.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  const BASE_URL = 'https://api.themoviedb.org/3';

  late TelevisionRemoteDataSourceImpl remoteDataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSource = TelevisionRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('getOnTheAirShows', () {
    test(
      'should return list of TelevisionModel when the response code is 200',
      () async {
        when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY')))
            .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/television_list_response.json'),
                  200,
                ));

        final result = await remoteDataSource.getOnTheAirShows();

        expect(result, equals(testTelevisionModelList));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY')))
            .thenAnswer((_) async => http.Response('Not Found', 400));

        final call = remoteDataSource.getOnTheAirShows();

        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('getPopularShows', () {
    test(
      'should return list of TelevisionModel when the response code is 200',
      () async {
        when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
            .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/television_list_response.json'),
                  200,
                ));

        final result = await remoteDataSource.getPopularShows();

        expect(result, equals(testTelevisionModelList));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
            .thenAnswer((_) async => http.Response('Not Found', 400));

        final call = remoteDataSource.getPopularShows();

        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('getTopRatedShows', () {
    test(
      'should return list of TelevisionModel when the response code is 200',
      () async {
        when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY')))
            .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/television_list_response.json'),
                  200,
                ));

        final result = await remoteDataSource.getTopRatedShows();

        expect(result, equals(testTelevisionModelList));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY')))
            .thenAnswer((_) async => http.Response('Not Found', 400));

        final call = remoteDataSource.getTopRatedShows();

        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('searchShows', () {
    const testQuery = 'dark';

    test(
      'should return list of TelevisionModel when the response code is 200',
      () async {
        when(mockHttpClient.get(
                Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$testQuery')))
            .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/television_list_response.json'),
                  200,
                ));

        final result = await remoteDataSource.searchShows(testQuery);

        expect(result, equals(testTelevisionModelList));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        when(mockHttpClient.get(
          Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$testQuery'),
        )).thenAnswer((_) async => http.Response('Not Found', 400));

        final call = remoteDataSource.searchShows(testQuery);

        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('getShowDetail', () {
    const testId = 1399;

    test(
      'should return TelevisionDetailModel when the response code is 200',
      () async {
        when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$testId?$API_KEY')))
            .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/television_detail.json'),
                  200,
                ));

        final result = await remoteDataSource.getShowDetail(testId);

        expect(result, equals(testTelevisionDetailModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$testId?$API_KEY')))
            .thenAnswer((_) async => http.Response('Not Found', 400));

        final call = remoteDataSource.getShowDetail(testId);

        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('getShowRecommendations', () {
    const testId = 1399;

    test(
      'should return list of TelevisionModel when the response code is 200',
      () async {
        when(mockHttpClient.get(
                Uri.parse('$BASE_URL/tv/$testId/recommendations?$API_KEY')))
            .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/television_list_response.json'),
                  200,
                ));

        final result = await remoteDataSource.getShowRecommendations(testId);

        expect(result, equals(testTelevisionModelList));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        when(mockHttpClient.get(
                Uri.parse('$BASE_URL/tv/$testId/recommendations?$API_KEY')))
            .thenAnswer((_) async => http.Response('Not Found', 400));

        final call = remoteDataSource.getShowRecommendations(testId);

        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });
}
