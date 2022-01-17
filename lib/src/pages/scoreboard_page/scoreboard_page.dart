import 'package:flutter/material.dart';
import 'package:scoremaster/src/config/theme/app_colors.dart';
import 'package:scoremaster/src/pages/scoreboard_page/widgets/custom_leaders.dart';
import 'package:scoremaster/src/pages/scoreboard_page/widgets/custom_tab_bar.dart';

class ScoreboardPage extends StatelessWidget {
  const ScoreboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Leaderboard',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: CustomTabBar(),
          ),
          SizedBox(
            height: 20,
          ),
          CustomLeaders(),
          Text("bla"),
        ],
      ),
    );
  }
}
