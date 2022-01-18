import 'package:flutter/material.dart';
import 'package:scoremaster/src/config/theme/app_colors.dart';
import 'package:scoremaster/src/pages/scoreboard_page/widgets/custom_highscore_list.dart';
import 'package:scoremaster/src/pages/scoreboard_page/widgets/custom_leaders.dart';
import 'package:scoremaster/src/pages/scoreboard_page/widgets/custom_tab_bar.dart';

class ScoreboardPage extends StatelessWidget {
  const ScoreboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // TODO this could be a "custom-appbar" (simply extend appbar and configure it as needed in the super constructor call)
      appBar: AppBar(
        title: const Text(
          'Leaderboard',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      // TODO no tab controller needed :)
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            const Padding(
              // TODO now that you've advanced to the next level, I'd like you to remove any magic numbers and implement a basic design system. User t-shirt sizing with M being the base size and all other sizes being a factor of it. (e.g. M = 8.0, S = M / 1.5)
              padding: EdgeInsets.all(20.0),
              child: CustomTabBar(),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              // TODO refactor tab bar view into buttons which filter the data accordingly
              child: TabBarView(
                children: <Widget>[
                  Column(
                    children: const [
                      CustomLeaders(),
                      // TODO why do you need this widget?
                      SingleChildScrollView(
                        child: CustomHighscoreList(),
                      ),
                    ],
                  ),
                  const Center(
                    child: Text(
                      'nothing here yet',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'nothing here yet too',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
