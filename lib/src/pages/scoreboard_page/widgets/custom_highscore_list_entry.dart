import 'package:flutter/material.dart';
import 'package:scoremaster/src/config/app_spacing.dart';
import 'package:scoremaster/src/config/theme/app_colors.dart';

class CustomHighscoreListEntry extends StatelessWidget {
  const CustomHighscoreListEntry({
    Key? key,
    required this.place,
    required this.avatarPath,
    required this.username,
    required this.score,
    this.iconIndicator,
  }) : super(key: key);

  final int place;
  final String avatarPath;
  final String username;
  final int score;
  final Icon? iconIndicator;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: AppSpacing.XL,
        ),
        Column(
          children: <Widget>[
            Text(
              place.toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const Icon(
              Icons.arrow_drop_up,
              color: AppColors.accent,
            ),
          ],
        ),
        const SizedBox(
          width: AppSpacing.XL,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                  child: Image(
                    width: 50,
                    height: 50,
                    image: AssetImage(avatarPath),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      username,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
                Text(
                  score.toString(),
                  style: const TextStyle(
                    fontSize: AppFontSizes.L,
                    color: AppColors.accent,
                  ),
                ),
                const SizedBox(
                  width: AppSpacing.XL,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: AppSpacing.XL,
        ),
      ],
    );
  }
}
