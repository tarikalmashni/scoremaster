import 'package:flutter/material.dart';
import 'package:scoremaster/src/config/app_spacing.dart';
import 'package:scoremaster/src/config/theme/app_colors.dart';

class CustomLeadersColumn extends StatelessWidget {
  const CustomLeadersColumn({
    Key? key,
    required this.rank,
    this.iconIndicator,
    required this.avatarPath,
    required this.username,
    required this.score,
  }) : super(key: key);

  final int rank;
  final Icon? iconIndicator;
  final String avatarPath;
  final String username;
  final int score;

  @override
  Widget build(BuildContext context) {
    final double paddingTop = (rank != 1) ? AppSpacing.XXL * 1.5 : 0;
    final double paddingLeft = (rank == 2) ? AppSpacing.XXL * 3 : 0;
    final double paddingRight = (rank == 3) ? AppSpacing.XXL * 3 : 0;
    final double shadowOpacity = rank == 1 ? 0.5 : 0;

    return Positioned(
      top: paddingTop,
      left: paddingLeft,
      right: paddingRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            rank.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Center(
            child: iconIndicator ??
                const Image(
                  image: AssetImage('assets/mock/icons/crown.png'),
                  width: AppSpacing.XXL,
                  fit: BoxFit.cover,
                ),
          ),
          const SizedBox(
            height: AppSpacing.XL,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: rank == 1 ? 5 : 2,
                color: AppColors.accent,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              // ? how to apply only to rank == 1? If statement before boxShadow doesn't seem to work
              boxShadow: [
                BoxShadow(
                  color: AppColors.accent.withOpacity(shadowOpacity),
                  spreadRadius: AppSpacing.S,
                  blurRadius: AppSpacing.L,
                  offset: const Offset(0, AppSpacing.XS),
                ),
              ],
            ),
            // TODO Container itself has a clip property, use it instead of unnecessarily adding another widget to the tree :)
            // ? Container doesn't seem to have a clip property as you promised? Don't fool me.
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              child: Image(
                image: AssetImage(avatarPath),
                fit: BoxFit.cover,
              ),
            ),
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            username,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            score.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.accent,
              fontSize: AppFontSizes.L,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
