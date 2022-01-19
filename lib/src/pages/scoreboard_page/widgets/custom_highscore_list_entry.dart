import 'package:flutter/material.dart';
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
        const SizedBox(width: 20),
        Container(
          width: 280,
          height: 50,
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
                  image: AssetImage(avatarPath),
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      username,
                      textAlign: TextAlign.left, // ? funzt nicht?
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      score.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.accent,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
