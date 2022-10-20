import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:television/src/data/models/television_response_model.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../json_reader.dart';

void main() {
  const testTelevisionResponseModel =
      TelevisionResponseModel(televisionModelList: testTelevisionModelList);

  group('fromJson', () {
    test('should return a valid model from JSON', () {
      final json =
          jsonDecode(readJson('dummy_data/television_list_response.json'));

      final result = TelevisionResponseModel.fromJson(json);

      expect(result, testTelevisionResponseModel);
    });
  });
}
