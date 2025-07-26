import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/feature/dash_board/auth/login/widget/login_card.dart';

class DesktopLoginLayout extends StatefulWidget {
  const DesktopLoginLayout({super.key});

  @override
  State<DesktopLoginLayout> createState() => _DesktopLoginLayoutState();
}

class _DesktopLoginLayoutState extends State<DesktopLoginLayout>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // إعداد الأنيميشن لتحريك الصورة للأعلى والأسفل
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// قسم المعلومات على اليسار
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _animation.value),
                    child: CircleAvatar(
                      radius: 20.h,
                      backgroundImage:
                          const AssetImage("assets/images/png/amrtwo.png"),
                      backgroundColor: Colors.white.withOpacity(0.2),
                    ),
                  );
                },
              ),
              SizedBox(height: 10.h),
              Text(
                "الــعـــــــــــــــارف",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "أهلا بك! سجل الدخول إلى حسابك",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        /// فورم تسجيل الدخول
        const Expanded(
          child: LoginCard(),
        ),
      ],
    );
  }
}
