import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/feature/dash_board/auth/register/widget/register_card_widget.dart';

/// **تصميم سطح المكتب**

class DesktopLayoutWidget extends StatefulWidget {
  const DesktopLayoutWidget({super.key});

  @override
  State<DesktopLayoutWidget> createState() => _DesktopLayoutWidgetState();
}

class _DesktopLayoutWidgetState extends State<DesktopLayoutWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
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
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5.h),
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
                style: StylesManager.styleBold30(context).copyWith(
                  color: ColorsManger.white,
                  fontSize: 20.sp,
                ),
              ),
              Text(
                "أهلا بك! سجل الدخول إلى حسابك",
                style: StylesManager.style22Bold(context).copyWith(
                  color: ColorsManger.white70,
                  fontSize: 16.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const Expanded(child: RegisterCardWidget()),
      ],
    );
  }
}
