import 'package:rive/rive.dart';
import 'package:start_up_workspace/models/nav_item_model.dart';
import 'package:start_up_workspace/resources/helpers/all_imports.dart';

import '../../models/rive_model.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int index) onTap;
  final int selectedNavIndex;

  const BottomNavBar({
    super.key,
    required this.onTap,
    required this.selectedNavIndex,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<SMIBool> riveIconInput = [];
  List<StateMachineController?> stateMachineControllers = [];

  @override
  void dispose() {
    for (var controller in stateMachineControllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  List<NavItemModel> bottonNavItem = [
    NavItemModel(
      title: 'Chat',
      rive: RiveModel(
        src: 'assets/images/icon.riv',
        artboard: 'CHAT',
        statMachinName: 'CHAT_Interactivity',
      ),
    ),
    NavItemModel(
      title: 'Search',
      rive: RiveModel(
        src: 'assets/images/icon.riv',
        artboard: 'SEARCH',
        statMachinName: 'SEARCH_Interactivity',
      ),
    ),
    NavItemModel(
      title: 'Timer',
      rive: RiveModel(
        src: 'assets/images/icon.riv',
        artboard: 'TIMER',
        statMachinName: 'TIMER_Interactivity',
      ),
    ),
    NavItemModel(
      title: 'Notifiction',
      rive: RiveModel(
        src: 'assets/images/icon.riv',
        artboard: 'BELL',
        statMachinName: 'BELL_Interactivity',
      ),
    ),
    NavItemModel(
      title: 'Profile',
      rive: RiveModel(
        src: 'assets/images/icon.riv',
        artboard: 'USER',
        statMachinName: 'USER_Interactivity',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int currentIndex = widget.selectedNavIndex;
    return SafeArea(
      child: Container(
        height: 50,
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withOpacity(0.3),
              offset: const Offset(0, 20),
              blurRadius: 20,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            bottonNavItem.length,
            (index) => GestureDetector(
              onTap: () {
                widget.onTap(index);
                currentIndex = index;
                riveIconInput[currentIndex].change(true);
                Future.delayed(const Duration(milliseconds: 300), () {
                  riveIconInput[currentIndex].change(false);
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _AnimatedBar(
                    isActive: currentIndex == index,
                  ),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Opacity(
                      opacity: currentIndex == index ? 1 : 0.5,
                      child: RiveAnimation.asset(
                        bottonNavItem[index].rive.src,
                        artboard: bottonNavItem[index].rive.artboard,
                        onInit: (artboard) {
                          StateMachineController? stateMachineController =
                              StateMachineController.fromArtboard(
                                  artboard, bottonNavItem[index].rive.statMachinName);
                          artboard.addController(stateMachineController!);
                          stateMachineControllers.add(stateMachineController);
                          riveIconInput
                              .add(stateMachineController.findInput<bool>('active') as SMIBool);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedBar extends StatelessWidget {
  const _AnimatedBar({required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 2),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: BoxDecoration(
          color: theme.colorScheme.background, borderRadius: BorderRadius.circular(12)),
    );
  }
}
