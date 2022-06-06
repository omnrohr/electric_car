import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constantine.dart';

class TempButton extends StatelessWidget {
  const TempButton({
    Key? key,
    required this.svgSrc,
    required this.title,
    this.isActive = false,
    required this.onPress,
    this.color = primaryColor,
  }) : super(key: key);

  final String svgSrc, title;
  final bool isActive;
  final VoidCallback onPress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isActive ? 76 : 50,
            height: isActive ? 76 : 50,
            child: SvgPicture.asset(
              svgSrc,
              color: isActive ? color : Colors.white38,
            ),
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            style: TextStyle(
                color: isActive ? color : Colors.white38,
                fontSize: isActive ? 18 : 16,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
            child: Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
