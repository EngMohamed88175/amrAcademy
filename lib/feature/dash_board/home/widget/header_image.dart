import 'package:flutter/widgets.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:screen_go/functions/screen_type_value_func.dart';
import 'package:schoolacademy/core/utils/helper/app_image_helper.dart';

class HeaderImage extends StatelessWidget {
  final String path;

  const HeaderImage({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.sp),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.sp),
        child: AppImageHelper(
          path: path,
          width: stv(
            context: context,
            mobile: 100.w,
            tablet: 60.w,
            desktop: 50.w,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
