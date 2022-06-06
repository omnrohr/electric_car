import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  int selectedBottomTab = 0;

  bool isRightDoorLock = true;
  bool isLeftDoorLock = true;
  bool isTrunkLock = true;
  bool isBonnetLock = true;

  void updateRightDoorLock() {
    isRightDoorLock = !isRightDoorLock;
    notifyListeners();
  }

  void updateLeftDoorLock() {
    isLeftDoorLock = !isLeftDoorLock;
    notifyListeners();
  }

  void updateBonnetLock() {
    isBonnetLock = !isBonnetLock;
    notifyListeners();
  }

  void updateTrunkLock() {
    isTrunkLock = !isTrunkLock;
    notifyListeners();
  }

  void updateSelectedBottomTab(int tab) {
    selectedBottomTab = tab;
    notifyListeners();
  }

  bool isCoolSelected = true;

  void updateCoolSelect() {
    isCoolSelected = !isCoolSelected;
    notifyListeners();
  }

  bool isShowTyre = false;

  void showTyres(int index) {
    if (selectedBottomTab != 3 && index == 3) {
      Future.delayed(const Duration(milliseconds: 400), () {
        isShowTyre = true;
        notifyListeners();
      });
    } else {
      isShowTyre = false;
      notifyListeners();
    }
  }

  bool isShowTyreStatus = false;

  void tyreStatusController(int index) {
    if (selectedBottomTab != 3 && index == 3) {
      isShowTyreStatus = true;
      notifyListeners();
    } else {
      Future.delayed(const Duration(milliseconds: 600), () {
        isShowTyreStatus = false;
        notifyListeners();
      });
    }
  }

  int temperature = 20;

  void increaseTemp() {
    temperature += 1;
    notifyListeners();
  }

  void decreaseTemp() {
    temperature -= 1;
    notifyListeners();
  }
}
