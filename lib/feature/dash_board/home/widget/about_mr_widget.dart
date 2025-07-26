import 'package:flutter/material.dart';
import 'package:screen_go/enums/screen_type_enums.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:screen_go/functions/get_screen_type_func.dart';
import 'package:screen_go/functions/screen_type_value_func.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/constant/image_assets.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';
import 'package:schoolacademy/core/utils/helper/app_image_helper.dart';

class AboutMrWidget extends StatelessWidget {
  const AboutMrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenType = getScreenType(MediaQuery.of(context));

    final imageSize = stv(
      context: context,
      mobile: 65.sp,
      tablet: 65.sp,
      desktop: MediaQuery.of(context).size.height * 0.50,
    );

    final textStyle = StylesManager.styleBold35Regular(context).copyWith(
      fontSize: stv(
        context: context,
        mobile: 16.sp,
        tablet: 16.sp,
        desktop: 16.sp,
      ),
      color: ColorsManger.black,
    );

    final titleTextStyle = StylesManager.styleBold20ReemKufi(context).copyWith(
      color: ColorsManger.primaryColor,
      fontSize:
          stv(context: context, mobile: 25.sp, tablet: 25.sp, desktop: 24.sp),
    );

    Widget buildTextContent() {
      return Column(
        children: [
          Text(
            "مدرس أول لغة عربية حاصل على ليسانس آداب قسم اللغة العربية بجامعة حلوان\n"
            "حاصل على دبلوم تربوي بجامعة السادات\n"
            "ذو خبرة بمجال التدريس الأونلاين 3 سنوات\n"
            "متخصص في المرحلة الإبتدائية والإعدادية\n"
            "خليك فاكر إن النحو لعبة لازم تفهمها عشان تعرف تكسبها",
            style: TextStyle(
              fontWeight: FontWeight.bold, // يمكنك تعديل الخط هنا إذا أردت
              fontSize: 16.sp, // تأكد من تحديد حجم الخط حسب حجم الشاشة
              color: ColorsManger.black, // تأكد من تحديد اللون حسب التفضيل
            ),
            textAlign: TextAlign.center, // لضبط النص في المنتصف
          ),
        ],
      );
    }

    Widget buildMobileOrTabletContent() {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: stv(
                context: context,
                mobile: 3.sp,
                tablet: 5.sp,
                desktop: MediaQuery.of(context).size.width * 0.040,
              ),
              vertical: stv(
                context: context,
                mobile: 15.sp,
                tablet: MediaQuery.of(context).size.height * 0.15,
                desktop: MediaQuery.of(context).size.height * 0.15,
              ),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: AppImageHelper(
                path: ImageAssetsManger.amrshape,
                height: imageSize,
              ),
            ),
          ),
          Text("عن مستر عمرو عارف", style: titleTextStyle),
          SizedBox(height: 5.h),
          Text(
            "مدرس أول لغة عربية حاصل على ليسانس آداب قسم اللغة العربية بجامعة حلوان\n"
            "حاصل على دبلوم تربوي بجامعة السادات\n"
            "ذو خبرة بمجال التدريس الأونلاين 3 سنوات\n"
            "متخصص في المرحلة الإبتدائية والإعدادية\n"
            "خليك فاكر إن النحو لعبة لازم تفهمها عشان تعرف تكسبها",
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    Widget buildDesktopContent() {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: stv(
            context: context,
            mobile: 3.sp,
            tablet: 5.sp,
            desktop: 20.sp,
          ),
          vertical: stv(
            context: context,
            mobile: 15.sp,
            tablet: MediaQuery.of(context).size.height * 0.15,
            desktop: MediaQuery.of(context).size.height * 0.15,
          ),
        ),
        child: Row(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: AppImageHelper(
                path: ImageAssetsManger.amrshape,
                height: imageSize,
              ),
            ),
            Spacer(), // Space between image and text
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("عن مستر عمرو عارف", style: titleTextStyle),
                buildTextContent(),
              ],
            ),
          ],
        ),
      );
    }

    if (screenType == DeviceScreenType.desktop) {
      return buildDesktopContent();
    } else {
      return buildMobileOrTabletContent();
    }
  }
}
