import 'package:flutter/material.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected; // التحديد
  final VoidCallback onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManger.primaryColor.withOpacity(0.1) // الأزرق إذا كان محددًا
              : ColorsManger.gray[200], // رمادي إذا لم يكن محددًا
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            // Icon
            Icon(
              icon,
              color: isSelected
                  ? ColorsManger.primaryColor // الأزرق إذا كان محددًا
                  : ColorsManger.black, // رمادي إذا لم يكن محددًا
              size: 24,
            ),
            SizedBox(width: 16.0),
            // Text
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? ColorsManger.primaryColor // الأزرق إذا كان محددًا
                      : ColorsManger.black, // رمادي إذا لم يكن محددًا
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
