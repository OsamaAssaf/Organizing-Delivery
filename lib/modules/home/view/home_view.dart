import 'package:start_up_workspace/resources/widgets/bottom_vav_bar.dart';
import '../../../resources/helpers/all_imports.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  // int index2 = 0;
  HomeView({super.key});

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return UpgradeDialog(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: const DrawerHome(),
        bottomNavigationBar: GetBuilder<HomeController>(
          builder: (controller) {
            return BottomNavBar(
              onTap: (int index) {
                controller.changeIndex(index);
              },
              selectedNavIndex: controller.selectedNavIndex,
            );

            // return BottomNavBar(
            //   onInit: (artboard) {
            //     log('******************************************');
            //     StateMachineController? controller =
            //         StateMachineController.fromArtboard(artboard,
            //             bottonNavItem[controllerr.index].rive.statMachinName);
            //     artboard.addController(controller!);
            //     controllerr.controllers.add(controller);
            //     controllerr.riveIconInput
            //         .add(controller.findInput<bool>('active') as SMIBool);
            //     log(controllerr.riveIconInput.toString());
            //     controllerr.update();
            //   },
            //   onTap: (index) {
            //     controllerr.index = index;
            //     controllerr.riveIconInput[controllerr.index].change(true);
            //     Future.delayed(const Duration(seconds: 1), () {
            //       controllerr.riveIconInput[controllerr.index].change(false);
            //     });
            //     controllerr.selectedNavIndex = controllerr.index;
            //     controllerr.update();
            //   },
            //   isActive: controllerr.index == controllerr.selectedNavIndex,
            //   opacity:
            //       controllerr.selectedNavIndex == controllerr.index ? 1 : 0.5,
            // );

            // SafeArea(
            //     child: Container(
            //   height: 50,
            //   margin: const EdgeInsets.all(12),
            //   padding: const EdgeInsets.symmetric(horizontal: 24),
            //   decoration: BoxDecoration(
            //     color: const Color(0xff17283A),
            //     borderRadius: BorderRadius.circular(24),
            //     boxShadow: [
            //       BoxShadow(
            //         color: const Color(0xff17283A).withOpacity(0.3),
            //         offset: const Offset(0, 20),
            //         blurRadius: 20,
            //       )
            //     ],
            //   ),
            //   child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: List.generate(
            //           bottonNavItem.length,
            //           (index) => GestureDetector(
            // onTap: () {
            //   controllerr.riveIconInput[index].change(true);
            //   Future.delayed(const Duration(seconds: 1), () {
            //     controllerr.riveIconInput[index].change(false);
            //   });
            //   controllerr.selectedNavIndex = index;
            //   controllerr.update();
            // },
            //                 child: Column(
            //                   mainAxisSize: MainAxisSize.min,
            //                   children: [
            //                     AnimatedBar(
            //                       isActive: index == controllerr.selectedNavIndex,
            //                     ),
            //                     SizedBox(
            //                       height: 36,
            //                       width: 36,
            //                       child: Opacity(
            // opacity: controllerr.selectedNavIndex == index
            //     ? 1
            //     : 0.5,
            //                         child: RiveAnimation.asset(
            //                           bottonNavItem[index].rive.src,
            //                           artboard:
            //                               bottonNavItem[index].rive.artboard,
            // onInit: (artboard) {
            //   StateMachineController? controller =
            //       StateMachineController.fromArtboard(
            //           artboard,
            //           bottonNavItem[index]
            //               .rive
            //               .statMachinName);
            //   artboard.addController(controller!);
            //   controllerr.controllers.add(controller);
            //   controllerr.riveIconInput.add(
            //       controller.findInput<bool>('active')
            //           as SMIBool);
            // },
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ))),
            // ));
          },
        ),
      ),
    );
  }
}
