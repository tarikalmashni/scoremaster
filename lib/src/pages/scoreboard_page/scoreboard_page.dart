import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:scoremaster/src/config/app_spacing.dart';
import 'package:scoremaster/src/config/theme/app_colors.dart';
import 'package:scoremaster/src/models/game_model.dart';
import 'package:scoremaster/src/models/score_model.dart';
import 'package:scoremaster/src/models/user_model.dart';
import 'package:scoremaster/src/pages/scoreboard_page/widgets/custom_highscore_list.dart';
import 'package:scoremaster/src/pages/scoreboard_page/widgets/custom_leaders.dart';
import 'package:scoremaster/src/pages/scoreboard_page/widgets/custom_tab_bar.dart';
import 'package:scoremaster/src/services/game_service.dart';
import 'package:scoremaster/src/services/score_service.dart';
import 'package:scoremaster/src/services/user_service.dart';

class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage({Key? key}) : super(key: key);

  @override
  State<ScoreboardPage> createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage> {
  final GlobalKey<FormState> formKey = GlobalKey();

  List<GameModel>? _games;
  List<ScoreModel>? _scores;
  List<UserModel>? _users;

  dynamic _ranking;

  @override
  void initState() {
    _fetchGames();
    _fetchScores();
    _fetchUsers();

    super.initState(); // ! bleib immer drin und immer am Schluss der initState, Junge!
  }

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
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(AppPaddings.M),
            child: CustomTabBar(),
          ),
          const SizedBox(
            // TODO now that you've advanced to the next level, I'd like you to remove any magic numbers and implement a basic design system. User t-shirt sizing with M being the base size and all other sizes being a factor of it. (e.g. M = 8.0, S = M / 1.5)
            height: 20,
          ),
          const CustomLeaders(),
          // TODO why do you need this widget?
          Expanded(
            child: CustomHighscoreList(
              games: _games,
              scores: _scores,
              users: _users,
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.accent.withOpacity(0.5),
              spreadRadius: AppSpacing.XS,
              blurRadius: AppSpacing.XS,
              offset: const Offset(0, AppSpacing.XS),
            ),
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          // TODO refactor the bottom modal to separate file
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                List<String> _usernames = [];

                _users?.forEach((element) {
                  _usernames.add(element.username);
                });

                _usernames = [
                  ...{..._usernames}
                ];

                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Scaffold(
                    backgroundColor: AppColors.background,
                    body: Padding(
                      padding: const EdgeInsets.all(AppSpacing.M),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.accent,
                                    width: AppSpacing.XS,
                                  ),
                                ),
                                label: Text('Username'),
                              ),
                              items: [
                                for (String username in _usernames)
                                  DropdownMenuItem(
                                    child: Text(username),
                                    value: username,
                                  ),
                              ],
                              onChanged: (item) => print('filterKey user selected: $item'),
                            ),
                            TextFormField(
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  return;
                                }

                                print('filterKey Score changed to: $value');
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: const Icon(
            Icons.add,
            color: AppColors.accent,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  _fetchGames() async {
    final games = await GameService.instance.fetchGames();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      setState(() {
        _games = games;
      });
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      print('filterKey from fetchGames');
      _createUserRanking();
    });
  }

  _fetchScores() async {
    final scores = await ScoreService.instance.fetchScores();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      setState(() {
        _scores = scores;
      });
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      print('filterKey from fetchScores');
      _createUserRanking();
    });
  }

  _fetchUsers() async {
    final users = await UserService.instance.fetchUsers();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      setState(() {
        _users = users;
      });
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      print('filterKey from fetchUsers');
      _createUserRanking();
    });
  }

  void _createUserRanking() {
    bool isLoaded = _ranking == null && _games != null && _scores != null && _users != null;
    if (isLoaded) {
      // TODO: Do I really need this?
      setState(() {
        // TODO: go on here and build the actual ranking object
        _ranking = _games;
      });
    }
  }
}
