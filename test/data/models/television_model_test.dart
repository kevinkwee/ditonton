import 'dart:convert';

import 'package:ditonton/data/models/television_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../json_reader.dart';

void main() {
  group('toEntity', () {
    test('should return a Television entity', () {
      final result = testTelevisionModel.toEntity();
      expect(result, testTelevision);
    });
  });

  group('fromJson', () {
    test('should return a valid model from JSON', () {
      final json = jsonDecode(readJson('dummy_data/television.json'));

      final result = TelevisionModel.fromJson(json);

      expect(result, testTelevisionModel);
    });
  });
}
