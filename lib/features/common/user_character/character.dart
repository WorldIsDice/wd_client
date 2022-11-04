import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Character extends StatefulWidget {
  Character({Key? key}) : super(key: key);

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  double size = 4.0;

  getHair() {
    double mysize = 9;
    return Container(
      height: 3 * mysize * size,
      width: 2 * mysize * size,
      child: SvgPicture.asset(
        "images/temp/char_hair.svg",
      ),
    );
  }

  getHead() {
    return Container(
      height: 13 * size,
      width: 13 * size,
      child: SvgPicture.asset(
        "images/temp/char_head.svg",
      ),
    );
  }

  getBody() {
    return Container(
      height: 15 * size,
      width: 15 * size,
      child: SvgPicture.asset(
        "images/temp/char_body.svg",
      ),
    );
  }

  getWeapon() {
    return Container(
      width: 8 * size,
      height: 20 * size,
      child: SvgPicture.asset(
        "images/temp/char_weapon.svg",
      ),
    );
  }

  getFace() {
    return Container(
      width: 13 * size,
      height: 13 * size,
      child: SvgPicture.asset(
        "images/temp/char_face.svg",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26 * size,
      height: 30 * size,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          // Container(
          //   width: size * 26,
          //   height: size * 30,
          //   color: Colors.amber,
          // ),

          // Head
          Positioned(
            bottom: 0,
            left: 2.5 * size,
            child: getBody(),
          ),
          Positioned(
            top: 3.5 * size,
            left: 2.5 * size,
            child: getHead(),
          ),
          Positioned(
            top: -7.5 * size,
            left: 0,
            child: getHair(),
          ),
          Positioned(
            top: 3 * size,
            left: 2.5 * size,
            child: getFace(),
          ),
          Positioned(
            top: 1.5 * size,
            right: 1.5 * size,
            child: getWeapon(),
          ),
        ],
      ),
    );
  }
}
