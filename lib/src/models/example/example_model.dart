import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_model.freezed.dart';

part 'example_model.g.dart';

@freezed
class ExampleModel with _$ExampleModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ExampleModel({
    required String uid,
    required String example,
  }) = _ExampleModel;

  factory ExampleModel.fromJson(Map<String, dynamic> json) => _$ExampleModelFromJson(json);
}
