import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../home_controller.dart';

import '../constanins.dart';
import './components/door_lock.dart';
import './components/custom_nav_bar.dart';
import './components/battery_status.dart';
import './components/temp_details.dart';
import './components/tyres.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _batteryAnimationController;
  late Animation<double> _animationBattery;
  late Animation<double> _animationBatteryStatus;
  late AnimationController _tempAnimationController;
  late Animation<double> _animationCarShift;
  late Animation<double> _animationTempShowInfo;
  late Animation<double> _animationShowCoolGlow;

  final HomeController _controller = HomeController();

  void setupBatteryAnimation() {
    _batteryAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _animationBattery = CurvedAnimation(
        parent: _batteryAnimationController, curve: Interval(0.0, 0.5));

    _animationBatteryStatus = CurvedAnimation(
        parent: _batteryAnimationController, curve: Interval(0.6, 1));
  }

  void setupTempAnimation() {
    _tempAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _animationCarShift = CurvedAnimation(
        parent: _tempAnimationController, curve: Interval(0.2, 0.4));
    _animationTempShowInfo = CurvedAnimation(
        parent: _tempAnimationController, curve: Interval(0.45, 0.65));
    _animationShowCoolGlow = CurvedAnimation(
        parent: _tempAnimationController, curve: Interval(0.7, 1));
  }

  @override
  void initState() {
    setupBatteryAnimation();
    setupTempAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _batteryAnimationController.dispose();
    _tempAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int temp = 20;
    return AnimatedBuilder(
        animation: Listenable.merge([
          _controller,
          _batteryAnimationController,
          _tempAnimationController
        ]),
        builder: (context, snapshot) {
          return Scaffold(
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: constraints.maxHeight,
                        width: constraints.maxHeight,
                      ),
                      Positioned(
                        left:
                            constraints.maxWidth / 2 * _animationCarShift.value,
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: constraints.maxHeight * 0.13,
                              bottom: constraints.maxHeight * 0.1),
                          child: SvgPicture.asset(
                            'assets/icons/Car.svg',
                            width: double.infinity,
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: defaultDuration,
                        top: _controller.selectedBottomTab == 0
                            ? constraints.maxHeight * 0.09
                            : constraints.maxWidth / 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: constraints.maxHeight * 0.1),
                          child: AnimatedOpacity(
                            duration: defaultDuration,
                            curve: Curves.easeIn,
                            opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                            child: DoorLock(
                              isLock: _controller.isBonnetLock,
                              onPress: _controller.updateBonnetLock,
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: defaultDuration,
                        curve: Curves.easeIn,
                        bottom: _controller.selectedBottomTab == 0
                            ? constraints.maxHeight * 0.07
                            : constraints.maxWidth / 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: constraints.maxHeight * 0.1),
                          child: AnimatedOpacity(
                            opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                            duration: defaultDuration,
                            child: DoorLock(
                              isLock: _controller.isTrunkLock,
                              onPress: _controller.updateTrunkLock,
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: defaultDuration,
                        curve: Curves.easeIn,
                        left: _controller.selectedBottomTab == 0
                            ? constraints.maxHeight * 0.1
                            : constraints.maxWidth / 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: constraints.maxHeight * 0.1),
                          child: AnimatedOpacity(
                            duration: defaultDuration,
                            opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                            child: DoorLock(
                              isLock: _controller.isLeftDoorLock,
                              onPress: _controller.updateLeftDoorLock,
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: defaultDuration,
                        curve: Curves.easeIn,
                        right: _controller.selectedBottomTab == 0
                            ? constraints.maxHeight * 0.1
                            : constraints.maxWidth / 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: constraints.maxHeight * 0.1),
                          child: AnimatedOpacity(
                            opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                            duration: defaultDuration,
                            child: DoorLock(
                              isLock: _controller.isRightDoorLock,
                              onPress: _controller.updateRightDoorLock,
                            ),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: _animationBattery.value,
                        child: SvgPicture.asset(
                          'assets/icons/Battery.svg',
                          width: constraints.maxWidth * 0.33,
                        ),
                      ),
                      Positioned(
                        top: 50 * (1 - _animationBatteryStatus.value),
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                        child: Opacity(
                            opacity: _animationBatteryStatus.value,
                            child: BatteryStatus()),
                      ),
                      // AnimatedPositioned(
                      //   duration: defaultDuration,
                      //   // top: 50 * (1 - _animationBatteryStatus.value),
                      //   top: _controller.selectedBottomTab == 1 ? 0 : 50,
                      //   height: constraints.maxHeight,
                      //   width: constraints.maxWidth,
                      //   child: AnimatedOpacity(
                      //       duration: defaultDuration,
                      //       opacity: _controller.selectedBottomTab == 1 ? 1 : 0,
                      //       child: BatteryStatus()),
                      // ),
                      Positioned(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                          top: 60 * (1 - _animationTempShowInfo.value),
                          child: Opacity(
                              opacity: _animationTempShowInfo.value,
                              child: TempDetails(
                                  controller: _controller, temp: temp))),

                      Positioned(
                          right: -180 * (1 - _animationShowCoolGlow.value),
                          child: AnimatedSwitcher(
                            duration: defaultDuration,
                            child: _controller.isCoolSelected
                                ? Image.asset(
                                    'assets/images/Cool_glow_2.png',
                                    key: UniqueKey(),
                                    width: 200,
                                  )
                                : Image.asset(
                                    'assets/images/Hot_glow_4.png',
                                    width: 200,
                                    key: UniqueKey(),
                                  ),
                          )),
                      ...tyres(constraints),
                    ],
                  );
                },
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              onPress: (value) {
                if (value == 1) {
                  _batteryAnimationController.forward();
                } else if (_controller.selectedBottomTab == 1 && value != 1) {
                  _batteryAnimationController.reverse(from: 0.7);
                }
                if (value == 2) {
                  _tempAnimationController.forward();
                } else if (_controller.selectedBottomTab == 2 && value != 2) {
                  _tempAnimationController.reverse(from: 0.4);
                }
                _controller.updateSelectedBottomTab(value);
              },
              selectedTab: _controller.selectedBottomTab,
            ),
          );
        });
  }
}
