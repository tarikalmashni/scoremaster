import 'package:flutter/material.dart';
import 'package:scoremaster/src/config/theme/app_colors.dart';

import 'custom_leaders_column.dart';

class CustomLeaders extends StatelessWidget {
  const CustomLeaders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 600,
      child: Stack(
        children: const <Widget>[
          CustomLeadersColumn(
            rank: 2,
            iconIndicator: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            avatarPath: 'assets/mock/pictures/profile-6.jpg',
            username: '@Tom',
            score: 5200,
          ),
          CustomLeadersColumn(
            rank: 3,
            iconIndicator: Icon(
              Icons.arrow_drop_up,
              color: AppColors.accent,
            ),
            avatarPath: 'assets/mock/pictures/profile-1.jpg',
            username: '@Daniel',
            score: 4400,
          ),
          CustomLeadersColumn(
            rank: 1,
            avatarPath: 'assets/mock/pictures/profile-3.jpg',
            username: '@Tarik',
            score: 6000,
          ),
        ],
      ),
    );
  }
}
