import 'dart:ui';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget childWidget;

  const BackgroundWidget({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage("assets/images/bg2.jpg"),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration:
                BoxDecoration(color: Colors.grey.shade200.withOpacity(0.25)),
            child: childWidget,
          ),
        ),
      ),
    );
  }
}
