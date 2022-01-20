import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scoremaster/src/models/score_model.dart';

class ScoreService {
  ScoreService._();

  static final ScoreService _instance = ScoreService._();

  static ScoreService get instance => _instance;

  Future<List<ScoreModel>> fetchScores() async {
    String data = await rootBundle.loadString('assets/mock/data/scores.json');

    List<dynamic> json = jsonDecode(data);

    return json.map((entry) => ScoreModel.fromJson(entry)).toList();
  }
}
