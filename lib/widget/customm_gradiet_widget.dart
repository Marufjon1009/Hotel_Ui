import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomGradientWidget extends StatelessWidget {
  final Widget? child;
  final String? image;

  const CustomGradientWidget(
      {super.key, required this.child, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              image!,
            ),
            fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.05),
              ]),
        ),
        child: child,
      ),
    );
  }
}
