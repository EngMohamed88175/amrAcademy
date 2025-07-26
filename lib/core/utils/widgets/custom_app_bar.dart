import 'package:flutter/material.dart';
import 'package:schoolacademy/core/Routes/routes.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/extensions/navigate.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/feature/dash_board/exam/widget/nav_bar_items.dart';
import 'package:schoolacademy/core/utils/constant/change_translate_and_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String selectedRoute;
  final void Function(BuildContext, String) onNavigate; // Update this line

  const CustomAppBar({
    super.key,
    required this.selectedRoute,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            context.pushNamedAndRemoveUntil(Routes.homeScreen,
                predicate: (route) => false);
          },
          icon: Icon(
            Icons.arrow_back,
            color: ChangeTheme.isDarkMode(context)
                ? ColorsManger.white
                : ColorsManger.black,
          )),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'الــعـــــــــــــــارف',
            style: TextStyle(
              fontSize: 16.sp, // الحجم الكبير لكلمة "عمرو"
              fontWeight: FontWeight.bold,
              color: ChangeTheme.isDarkMode(context)
                  ? ColorsManger.white
                  : ColorsManger.black, // اللون الخاص بـ "عمرو"
            ),
          ),
          Row(
            children: [
              NavBarItem(
                label: 'Home',
                isSelected: selectedRoute == 'home',
                onPressed: () =>
                    onNavigate(context, 'home'), // Pass both arguments
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
