import 'package:equatable/equatable.dart';

import 'television_model.dart';

class TelevisionResponseModel extends Equatable {
  const TelevisionResponseModel({
    required this.televisionModelList,
  });

  final List<TelevisionModel> televisionModelList;

  factory TelevisionResponseModel.fromJson(Map<String, dynamic> json) =>
      TelevisionResponseModel(
        televisionModelList: (json['results'] as List)
            .where((element) =>
                element['poster_path'] != null &&
                element['backdrop_path'] != null)
            .map((result) => TelevisionModel.fromJson(result))
            .toList(),
      );

  @override
  List<Object?> get props => [televisionModelList];
}
