import 'package:flutter/material.dart';
import 'package:scoremaster/src/config/theme/app_colors.dart';

import 'custom_leaders_column.dart';

class CustomLeaders extends StatelessWidget {
  const CustomLeaders({Key? key}) : super(key: key);

  final double paddingTop = 60;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 600,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: paddingTop,
            left: 60,
            child: const CustomLeadersColumn(
              rank: 2,
              iconIndicator: Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
              avatarPath: 'assets/mock/pictures/profile-6.jpg',
              username: '@Tom',
              score: 5200,
            ),
          ),
          Positioned(
            top: paddingTop,
            right: 60,
            child: const CustomLeadersColumn(
              rank: 3,
              iconIndicator: Icon(
                Icons.arrow_drop_up,
                color: AppColors.accent,
              ),
              avatarPath: 'assets/mock/pictures/profile-1.jpg',
              username: '@Daniel',
              score: 4400,
            ),
          ),
          const Positioned(
            top: 0,
            left: 146.5,
            child: CustomLeadersColumn(
              rank: 1,
              avatarPath: 'assets/mock/pictures/profile-3.jpg',
              username: '@Tarik',
              score: 6000,
            ),
          ),
        ],
      ),
    );
  }
}
