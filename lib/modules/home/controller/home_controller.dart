import 'package:rive/rive.dart';

import '../../../resources/helpers/all_imports.dart';

class HomeController extends GetxController {
  // List<SMIBool> riveIconInput = [];
  // List<StateMachineController?> stateMachineControllers = [];

  // int index = 0;

  // @override
  // void dispose() {
  //   for (var controller in stateMachineControllers) {
  //     controller?.dispose();
  //   }
  //   super.dispose();
  // }

  int selectedNavIndex = 0;
  void changeIndex(int value) {
    selectedNavIndex = value;
    update();
  }
}
