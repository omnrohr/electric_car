import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_animated/home_controler.dart';

import '../constanins.dart';
import './components/door_lock.dart';
import './components/custom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, snapshot) {
          return Scaffold(
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constrains) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Car.svg',
                        width: double.infinity,
                      ),
                      Positioned(
                        top: constrains.maxHeight * 0.01,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: constrains.maxHeight * 0.1),
                          child: DoorLock(
                            isLock: _controller.isBonnetLock,
                            onPress: _controller.updateBonnetLock,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: constrains.maxHeight * 0.01,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: constrains.maxHeight * 0.1),
                          child: DoorLock(
                            isLock: _controller.isTrunkLock,
                            onPress: _controller.updateTrunkLock,
                          ),
                        ),
                      ),
                      Positioned(
                        left: constrains.maxHeight * 0.02,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: constrains.maxHeight * 0.1),
                          child: DoorLock(
                            isLock: _controller.isLeftDoorLock,
                            onPress: _controller.updateLeftDoorLock,
                          ),
                        ),
                      ),
                      Positioned(
                        right: constrains.maxHeight * 0.02,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: constrains.maxHeight * 0.1),
                          child: DoorLock(
                            isLock: _controller.isRightDoorLock,
                            onPress: _controller.updateRightDoorLock,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              onPress: (value) {},
              selectedTab: 0,
            ),
          );
        });
  }
}
