import 'package:flutter/material.dart';
import 'package:scoremaster/src/config/theme/app_colors.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: const <Widget>[
        Expanded(
          child: Text(
            'Today',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Text(
            'Week',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Text(
            'Month',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.primary,
      ),
    );
  }
}
