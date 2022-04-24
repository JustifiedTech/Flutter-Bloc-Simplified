import 'package:flutter/material.dart';

import '../../utils/config/constants.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  final double maxSlide = 225.0;

  @override
  void initState() {
    // TODO: implement initState

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            double slide = maxSlide * animationController.value;
            double scale = 1 - (animationController.value * 0.3);
            return Stack(
              children: [
                drawer(),
                Transform(
                    transform: Matrix4.identity()
                      ..translate(slide)
                      ..scale(scale),
                    alignment: Alignment.centerLeft,
                    child: child())
              ],
            );
          }),
    );
  }

  Container child() {
    return Container(
      decoration: BoxDecoration(color: kRed),
    );
  }

  Container drawer() {
    return Container(
      decoration: BoxDecoration(color: kPurple),
    );
  }
}
