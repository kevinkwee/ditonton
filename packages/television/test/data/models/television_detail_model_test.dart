import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:television/src/data/models/television_detail_model.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../json_reader.dart';

void main() {
  group('toEntity', () {
    test('should return a TelevisionDetailModel entity', () {
      final result = testTelevisionDetailModel.toEntity();

      expect(result, testTelevisionDetail);
    });
  });

  group('fromJson', () {
    test('should return a valid model from JSON', () {
      final json = jsonDecode(readJson('dummy_data/television_detail.json'));

      final result = TelevisionDetailModel.fromJson(json);

      expect(result, testTelevisionDetailModel);
    });
  });
}
