import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/feature/dash_board/auth/register/widget/register_card_widget.dart';

/// **تصميم الموبايل والتابلت**

class MobileOrTabletLayoutWidget extends StatefulWidget {
  const MobileOrTabletLayoutWidget({super.key});

  @override
  State<MobileOrTabletLayoutWidget> createState() =>
      _MobileOrTabletLayoutWidgetState();
}

class _MobileOrTabletLayoutWidgetState extends State<MobileOrTabletLayoutWidget>
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

    _animation = Tween<double>(begin: 0, end: 10).animate(
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _animation.value),
                      child: CircleAvatar(
                        radius: 5.h,
                        backgroundImage:
                            const AssetImage("assets/images/png/amrtwo.png"),
                        backgroundColor: ColorsManger.white.withOpacity(0.2),
                      ),
                    );
                  },
                ),
                SizedBox(width: 4.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "الــعـــــــــــــــارف",
                      style: StylesManager.styleBold30(context)
                          .copyWith(color: ColorsManger.white, fontSize: 18.sp),
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      "أهلا بك! أنشئ حسابك الآن",
                      style: StylesManager.style22Bold(context).copyWith(
                          color: ColorsManger.white70, fontSize: 14.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          const RegisterCardWidget(),
        ],
      ),
    );
  }
}
