import 'package:flutter/material.dart';

import 'custom_highscore_list_entry.dart';

class CustomHighscoreList extends StatelessWidget {
  const CustomHighscoreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO this should be a listview.builder :) (But nice thing you discovered wraps and its sexy possibilites!)
    return ListView(
      children: const <Widget>[
        CustomHighscoreListEntry(
          place: 4,
          avatarPath: 'assets/mock/pictures/profile-2.jpg',
          username: '@Johannes',
          score: 4123,
        ),
        CustomHighscoreListEntry(
          place: 5,
          avatarPath: 'assets/mock/pictures/profile-4.jpg',
          username: '@Lukas',
          score: 8888,
        ),
        CustomHighscoreListEntry(
          place: 6,
          avatarPath: 'assets/mock/pictures/profile-5.jpg',
          username: '@Rico',
          score: 14123,
        ),
        CustomHighscoreListEntry(
          place: 6,
          avatarPath: 'assets/mock/pictures/profile-5.jpg',
          username: '@Rico',
          score: 14123,
        ),
        CustomHighscoreListEntry(
          place: 6,
          avatarPath: 'assets/mock/pictures/profile-5.jpg',
          username: '@Rico',
          score: 14123,
        ),
        CustomHighscoreListEntry(
          place: 6,
          avatarPath: 'assets/mock/pictures/profile-5.jpg',
          username: '@Rico',
          score: 14123,
        ),
        CustomHighscoreListEntry(
          place: 6,
          avatarPath: 'assets/mock/pictures/profile-5.jpg',
          username: '@Rico',
          score: 14123,
        ),
      ],
    );
  }
}
