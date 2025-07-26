import 'package:flutter/material.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';

class IndicatorLoading extends StatelessWidget {
  const IndicatorLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: CircularProgressIndicator(
        color: isDarkMode ? ColorsManger.red : ColorsManger.primaryColor,
      ),
    );
  }
}
