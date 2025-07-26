import 'package:flutter/material.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';

class NavBarItem extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;

  const NavBarItem({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? ColorsManger.primaryColor // النص عند التحديد
                : ColorsManger.black.withOpacity(0.7), // النص عند عدم التحديد
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
