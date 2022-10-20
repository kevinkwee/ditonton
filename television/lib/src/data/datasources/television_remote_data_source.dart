import 'dart:convert';

import 'package:core/core.dart';
import 'package:http/http.dart' as http;

import '../models/television_detail_model.dart';
import '../models/television_model.dart';
import '../models/television_response_model.dart';

abstract class TelevisionRemoteDataSource {
  Future<List<TelevisionModel>> getOnTheAirShows();
  Future<List<TelevisionModel>> getPopularShows();
  Future<List<TelevisionModel>> getTopRatedShows();
  Future<List<TelevisionModel>> getShowRecommendations(int id);
  Future<List<TelevisionModel>> searchShows(String query);
  Future<TelevisionDetailModel> getShowDetail(int id);
}

class TelevisionRemoteDataSourceImpl implements TelevisionRemoteDataSource {
  TelevisionRemoteDataSourceImpl({required this.client});

  static const apiKey = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const baseUrl = 'https://api.themoviedb.org/3';

  final http.Client client;

  @override
  Future<List<TelevisionModel>> getOnTheAirShows() async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey'));

    if (response.statusCode == 200) {
      return TelevisionResponseModel.fromJson(
        jsonDecode(response.body),
      ).televisionModelList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TelevisionModel>> getPopularShows() async {
    final response = await client.get(Uri.parse('$baseUrl/tv/popular?$apiKey'));

    if (response.statusCode == 200) {
      return TelevisionResponseModel.fromJson(
        jsonDecode(response.body),
      ).televisionModelList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TelevisionModel>> getTopRatedShows() async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey'));

    if (response.statusCode == 200) {
      return TelevisionResponseModel.fromJson(
        jsonDecode(response.body),
      ).televisionModelList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TelevisionModel>> searchShows(String query) async {
    final response = await client.get(
      Uri.parse('$baseUrl/search/tv?$apiKey&query=$query'),
    );

    if (response.statusCode == 200) {
      return TelevisionResponseModel.fromJson(
        jsonDecode(response.body),
      ).televisionModelList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TelevisionDetailModel> getShowDetail(int id) async {
    final response = await client.get(Uri.parse('$baseUrl/tv/$id?$apiKey'));

    if (response.statusCode == 200) {
      return TelevisionDetailModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TelevisionModel>> getShowRecommendations(int id) async {
    final response = await client.get(
      Uri.parse('$baseUrl/tv/$id/recommendations?$apiKey'),
    );

    if (response.statusCode == 200) {
      return TelevisionResponseModel.fromJson(jsonDecode(response.body))
          .televisionModelList;
    } else {
      throw ServerException();
    }
  }
}
