import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scoremaster/src/models/game_model.dart';
import 'package:scoremaster/src/models/ranking_model.dart';
import 'package:scoremaster/src/models/score_model.dart';
import 'package:scoremaster/src/models/user_model.dart';

import 'custom_highscore_list_entry.dart';

class CustomHighscoreList extends StatelessWidget {
  CustomHighscoreList({Key? key, this.games, this.scores, this.users}) : super(key: key);

  final List<GameModel>? games;
  final List<ScoreModel>? scores;
  final List<UserModel>? users;

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    final isLoaded = games != null && scores != null && users != null;
    scores?.sort((a, b) => b.score.compareTo(a.score));

    final List<RankingModel> _ranking = [];
    int rank = 1;

    scores?.forEach((element) {
      final RankingModel temp = RankingModel(
        rank: rank,
        avatarPath: 'assets/mock/pictures/profile-${random.nextInt(7) + 1}.jpg',
        username: '@${(isLoaded) ? users?.firstWhere((user) => user.uid == element.userUid).username : ''}',
        score: element.score,
      );
      rank++;
      _ranking.add(temp);
    });

    _ranking.removeRange(0, 3);

    return ListView.builder(
      itemCount: _ranking.length,
      itemBuilder: (context, index) {
        return CustomHighscoreListEntry(
          rank: _ranking[index].rank,
          avatarPath: _ranking[index].avatarPath,
          username: _ranking[index].username,
          score: _ranking[index].score,
        );
      },
      // itemCount: scores?.length,
      // itemBuilder: (context, index) {
      //   return CustomHighscoreListEntry(
      //     rank: 4, // TODO
      //     avatarPath: 'assets/mock/pictures/profile-${random.nextInt(7) + 1}.jpg',
      //     username: '@${(isLoaded) ? users?.firstWhere((user) => user.uid == scores?[index].userUid).username : ''}',
      //     score: scores?[index].score ?? 0,
      //   );
      // },
    );

    /*
    // TODO this should be a listview.builder :) (But nice thing you discovered wraps and its sexy possibilites!)
    return ListView(
      children: const <Widget>[
        CustomHighscoreListEntry(
          rank: 4,
          avatarPath: 'assets/mock/pictures/profile-2.jpg',
          username: '@Johannes',
          score: 4123,
        ),
        CustomHighscoreListEntry(
          rank: 5,
          avatarPath: 'assets/mock/pictures/profile-4.jpg',
          username: '@Lukas',
          score: 8888,
        ),
        CustomHighscoreListEntry(
          rank: 6,
          avatarPath: 'assets/mock/pictures/profile-5.jpg',
          username: '@Rico',
          score: 14123,
        ),
        CustomHighscoreListEntry(
          rank: 6,
          avatarPath: 'assets/mock/pictures/profile-5.jpg',
          username: '@Rico',
          score: 14123,
        ),
        CustomHighscoreListEntry(
          rank: 6,
          avatarPath: 'assets/mock/pictures/profile-5.jpg',
          username: '@Rico',
          score: 14123,
        ),
        CustomHighscoreListEntry(
          rank: 6,
          avatarPath: 'assets/mock/pictures/profile-5.jpg',
          username: '@Rico',
          score: 14123,
        ),
        CustomHighscoreListEntry(
          rank: 6,
          avatarPath: 'assets/mock/pictures/profile-5.jpg',
          username: '@Rico',
          score: 14123,
        ),
      ],
    );*/
  }
}
