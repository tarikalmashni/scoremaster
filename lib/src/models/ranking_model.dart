import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_model.freezed.dart';

part 'ranking_model.g.dart';

@freezed
class RankingModel with _$RankingModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory RankingModel({
    required int rank,
    required String avatarPath,
    required String username,
    required int score,
  }) = _RankingModel;

  factory RankingModel.fromJson(Map<String, dynamic> json) => _$RankingModelFromJson(json);
}
