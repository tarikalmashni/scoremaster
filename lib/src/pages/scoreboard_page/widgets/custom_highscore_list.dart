import 'package:flutter/material.dart';
import 'package:scoremaster/src/config/theme/app_colors.dart';

class CustomHighscoreList extends StatelessWidget {
  const CustomHighscoreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO this should be a listview.builder :) (But nice thing you discovered wraps and its sexy possibilites!)
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: const <Widget>[
        CustomListEntry(
          place: 4,
          avatarPath: 'assets/mock/pictures/profile-2.jpg',
          username: '@Johannes',
          score: 4123,
        ),
        CustomListEntry(
          place: 5,
          avatarPath: 'assets/mock/pictures/profile-4.jpg',
          username: '@Lukas',
          score: 4123,
        ),
        CustomListEntry(
          place: 6,
          avatarPath: 'assets/mock/pictures/profile-5.jpg',
          username: '@Rico',
          score: 4123,
        ),
        CustomListEntry(
          place: 6,
          avatarPath: 'assets/mock/pictures/florian.jpg',
          username: '@FlorianDerNoob',
          score: 4123,
        ),
      ],
    );
  }
}

class CustomListEntry extends StatelessWidget {
  // TODO for easier readability, I suggest you order parameters by required and not-required instead of mixing them :)
  const CustomListEntry({
    Key? key,
    required this.place,
    this.iconIndicator,
    required this.avatarPath,
    required this.username,
    required this.score,
  }) : super(key: key);

  final int place;
  final Icon? iconIndicator;
  final String avatarPath;
  final String username;
  final int score;

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
              color: AppColors.green,
            ),
          ],
        ),
        const SizedBox(width: 20),
        Container(
          width: 280,
          height: 50,
          decoration: const BoxDecoration(
            color: AppColors.darkGreen,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // TODO nice!
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
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  username,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                // alignment: Alignment.centerRight,
                child: Text(
                  score.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
