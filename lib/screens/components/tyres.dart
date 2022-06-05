import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<Widget> tyres(BoxConstraints constraints) {
  return [
    Positioned(
        top: constraints.maxHeight * 0.24,
        left: constraints.maxWidth * 0.28,
        child: SvgPicture.asset(
          'assets/icons/FL_Tyre.svg',
          height: 70,
        )),
    Positioned(
        top: constraints.maxHeight * 0.24,
        right: constraints.maxWidth * 0.28,
        child: SvgPicture.asset(
          'assets/icons/FL_Tyre.svg',
          height: 70,
        )),
    Positioned(
        bottom: constraints.maxHeight * 0.24,
        right: constraints.maxWidth * 0.28,
        child: SvgPicture.asset(
          'assets/icons/FL_Tyre.svg',
          height: 70,
        )),
    Positioned(
        bottom: constraints.maxHeight * 0.24,
        left: constraints.maxWidth * 0.28,
        child: SvgPicture.asset(
          'assets/icons/FL_Tyre.svg',
          height: 70,
        )),
  ];
}
