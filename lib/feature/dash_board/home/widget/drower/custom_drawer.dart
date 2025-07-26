import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schoolacademy/core/Routes/routes.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:screen_go/extensions/screen_type_value.dart';
import 'package:schoolacademy/core/utils/extensions/navigate.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/feature/dash_board/home/widget/drower/drower_items.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: Column(
        children: [
          // صورة المستخدم والعنوان مع خلفية
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // صورة المستخدم
                CircleAvatar(
                  radius: 17.sp,
                  backgroundColor: Colors.white,
                  backgroundImage: user?.photoURL != null
                      ? NetworkImage(user!.photoURL!)
                      : null,
                  child: user?.photoURL == null
                      ? Icon(
                          Icons.person,
                          size: 20.sp,
                          color: Colors.grey.shade400,
                        )
                      : null,
                ),

                // البريد الإلكتروني
                Expanded(
                  child: Flexible(
                    child: Text(
                      "Email : ${user?.email ?? 'user@example.com'}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsManger.white,
                        fontSize: stv(
                          context: context,
                          mobile: 16.sp,
                          tablet: 14.sp,
                          desktop: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // قائمة العناصر
          Expanded(
            child: ListView(
              children: [
                DrawerItem(
                  icon: Icons.home,
                  text: 'الرئيسية',
                  isSelected: selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                ),
                DrawerItem(
                  icon: Icons.book,
                  text: 'الاختبارات',
                  isSelected: selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                    context.pushNamed(Routes.examScreen);
                  },
                ),
               
              ],
            ),
          ),

          // الفوتر
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '© 2024 عمرو أكاديمي',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
