import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class OnCartIconButton extends StatelessWidget {
  final Widget icon;
  final void Function() onCartPressed;
  const OnCartIconButton(
      {super.key, required this.icon, required this.onCartPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      highlightColor: Colors.amber,
      iconSize: 20,
      style: IconButton.styleFrom(
        backgroundColor: Colors.black,
        elevation: 3,
        shadowColor: AppColors.orange,
        shape: const CircleBorder(),
      ),
      onPressed: onCartPressed,
      icon: icon,
    );
  }
}
