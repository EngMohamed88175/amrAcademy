import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/feature/dash_board/auth/login/widget/login_card.dart';

class MobileTabletLoginLayout extends StatefulWidget {
  const MobileTabletLoginLayout({super.key});

  @override
  State<MobileTabletLoginLayout> createState() =>
      _MobileTabletLoginLayoutState();
}

class _MobileTabletLoginLayoutState extends State<MobileTabletLoginLayout>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // إنشاء أنيميشن لتحريك الصورة للأعلى والأسفل
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true); // تكرار الأنيميشن ذهابًا وإيابًا

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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.translate(
                offset:
                    Offset(0, _animation.value), // تحريك الصورة للأعلى والأسفل
                child: CircleAvatar(
                  radius: 50, // يمكنك استخدام 10.h حسب الحاجة
                  backgroundImage:
                      const AssetImage("assets/images/png/amrtwo.png"),
                  backgroundColor: Colors.white.withOpacity(0.2),
                ),
              );
            },
          ),
          SizedBox(height: 5.h),
          Text(
            "الــعـــــــــــــــارف",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
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
          SizedBox(height: 10.h),
          const LoginCard(), // الفورم يكون تحته
        ],
      ),
    );
  }
}
