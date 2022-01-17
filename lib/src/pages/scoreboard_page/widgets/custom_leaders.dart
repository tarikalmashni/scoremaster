import 'package:flutter/material.dart';
import 'package:scoremaster/src/config/theme/app_colors.dart';

class CustomLeaders extends StatelessWidget {
  const CustomLeaders({Key? key}) : super(key: key);

  final double paddingTop = 60;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 600,
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: const <Widget>[
      //     CustomColumn(
      //       place: 2,
      //       iconIndicator: Icon(Icons.arrow_drop_down),
      //       avatarPath: 'assets/mock/pictures/profile-6.jpg',
      //       username: '@Tom',
      //       score: 5200,
      //     ),
      //     CustomColumn(
      //       place: 1,
      //       avatarPath: 'assets/mock/pictures/profile-3.jpg',
      //       username: '@Tarik',
      //       score: 6000,
      //     ),
      //     CustomColumn(
      //       place: 3,
      //       iconIndicator: Icon(Icons.arrow_drop_up),
      //       avatarPath: 'assets/mock/pictures/profile-1.jpg',
      //       username: '@Daniel',
      //       score: 4400,
      //     ),
      //   ],
      // ),
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Positioned(
            top: paddingTop,
            left: 60,
            child: const CustomColumn(
              place: 2,
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
            child: const CustomColumn(
              place: 3,
              iconIndicator: Icon(Icons.arrow_drop_up, color: AppColors.green),
              avatarPath: 'assets/mock/pictures/profile-1.jpg',
              username: '@Daniel',
              score: 4400,
            ),
          ),
          const Positioned(
            top: 0,
            left: 146.5,
            child: CustomColumn(
              place: 1,
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

class CustomColumn extends StatelessWidget {
  const CustomColumn({
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // if (place > 1)
        //   const SizedBox(
        //     height: 70,
        //   ),
        Text(
          place.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        Center(
          child: iconIndicator ??
              const Image(
                image: AssetImage('assets/mock/icons/crown.png'),
                width: 50,
                fit: BoxFit.cover,
              ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: place == 1 ? 5 : 2,
              color: AppColors.green,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
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
            color: AppColors.green,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}