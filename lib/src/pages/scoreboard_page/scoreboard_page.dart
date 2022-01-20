import 'package:flutter/material.dart';
import 'package:scoremaster/src/config/app_spacing.dart';
import 'package:scoremaster/src/config/theme/app_colors.dart';
import 'package:scoremaster/src/pages/scoreboard_page/widgets/custom_highscore_list.dart';
import 'package:scoremaster/src/pages/scoreboard_page/widgets/custom_leaders.dart';
import 'package:scoremaster/src/pages/scoreboard_page/widgets/custom_tab_bar.dart';

class ScoreboardPage extends StatelessWidget {
  const ScoreboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      // TODO this could be a "custom-appbar" (simply extend appbar and configure it as needed in the super constructor call)
      appBar: AppBar(
        title: const Text(
          'Leaderboard',
          style: TextStyle(fontSize: AppFontSizes.M),
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondary,
        elevation: 0,
      ),
      body: Column(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(AppPaddings.M),
            child: CustomTabBar(),
          ),
          SizedBox(
            // TODO now that you've advanced to the next level, I'd like you to remove any magic numbers and implement a basic design system. User t-shirt sizing with M being the base size and all other sizes being a factor of it. (e.g. M = 8.0, S = M / 1.5)
            height: 20,
          ),
          CustomLeaders(),
          // TODO why do you need this widget?
          Expanded(
            child: CustomHighscoreList(),
          ),
        ],
      ),
    );
  }
}
