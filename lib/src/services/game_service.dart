import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:scoremaster/src/models/game_model.dart';

class GameService {
  GameService._();

  static final GameService _instance = GameService._();

  static GameService get instance => _instance;

  Future<List<GameModel>> fetchGames() async {
    String data = await rootBundle.loadString('assets/mock/data/games.json');

    List<dynamic> json = jsonDecode(data);

    return json.map((entry) => GameModel.fromJson(entry)).toList();
  }
}
