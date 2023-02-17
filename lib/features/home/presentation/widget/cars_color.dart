import 'package:coordinadora_test/core/util/apcolors.dart';
import 'package:flutter/material.dart';

class CarsColor extends StatelessWidget {
  final String? title;
  final Color? color;
  final Widget? iconPer;
  const CarsColor({
    Key? key,
    this.title,
    this.color,
    this.iconPer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: APColors.whiteTechnical,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          iconPer!
        ],
      ),
    );
  }
}
