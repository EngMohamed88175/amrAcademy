import 'package:flutter/material.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';

class NavBarItem extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const NavBarItem({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          color: ColorsManger.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
