import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constanins.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedTab,
    required this.onPress,
  }) : super(key: key);

  final int selectedTab;
  final ValueChanged<int> onPress;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onPress,
      currentIndex: selectedTab,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      items: [
        ...List.generate(
          navIconSrc.length,
          (index) => BottomNavigationBarItem(
            icon: SvgPicture.asset(navIconSrc[index],
                color: index == selectedTab ? primaryColor : Colors.white54),
            label: '',
          ),
        ),
      ],
    );
  }
}

List<String> navIconSrc = [
  'assets/icons/Lock.svg',
  'assets/icons/Charge.svg',
  'assets/icons/Temp.svg',
  'assets/icons/Tyre.svg'
];
