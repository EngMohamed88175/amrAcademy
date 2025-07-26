import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/helper/app_image_helper.dart';
import 'package:schoolacademy/feature/dash_board/home/data/data_source/why_choose_amr_data_source.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class WhyChooseMrAmr extends StatelessWidget {
  final bool isMobile;
  final int containerCount;

  const WhyChooseMrAmr({
    super.key,
    required this.isMobile,
    required this.containerCount,
  });

  @override
  Widget build(BuildContext context) {
    // تعريف المقاسات داخل الودجت
    final double height = isMobile ? 40.h : 65.h;
    final double width = isMobile ? 80.w : 40.w;
    final double widthImage = 50.sp;

    // تعريف الأنماط داخل الودجت
    final TextStyle styleOne =
        StylesManager.styleBold20ReemKufi(context).copyWith(
      color: ColorsManger.orange,
      fontSize: isMobile ? 30.sp : 35.sp,
    );
    final TextStyle styleTwo =
        StylesManager.styleBold20ReemKufi(context).copyWith(
      color: ColorsManger.primaryColor,
      fontSize: isMobile ? 30.sp : 25.sp,
    );
    final TextStyle styleThree =
        StylesManager.styleBold20ReemKufi(context).copyWith(
      fontSize: isMobile ? 18.sp : 18.sp,
      color: ColorsManger.black,
    );
    final TextStyle styleFour =
        StylesManager.styleBold20ReemKufi(context).copyWith(
      fontSize: isMobile ? 18.sp : 16.sp,
      color: ColorsManger.black,
    );

    return Column(
      children: [
        Text("لماذا تختار", style: styleOne),
        Text("مستر عمرو عارف", style: styleTwo),
        SizedBox(height: 5.h),
        isMobile
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(containerCount, (index) {
                  return Card(
                    shadowColor: Colors.black,
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                      width: width,
                      height: height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppImageHelper(
                            path: WhyChooseAmrDataSource()
                                .whyChooseAmr[index]
                                .image,
                            width: widthImage,
                          ),
                          Flexible(
                            child: Text(
                              WhyChooseAmrDataSource().whyChooseAmr[index].text,
                              style: styleThree,
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              WhyChooseAmrDataSource().whyChooseAmr[index].des,
                              style: styleFour,
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(containerCount, (index) {
                  return Card(
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                      width: width,
                      height: height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppImageHelper(
                            path: WhyChooseAmrDataSource()
                                .whyChooseAmr[index]
                                .image,
                            width: widthImage,
                          ),
                          Text(
                            WhyChooseAmrDataSource().whyChooseAmr[index].text,
                            style: styleThree,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            WhyChooseAmrDataSource().whyChooseAmr[index].des,
                            style: styleFour,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
      ],
    );
  }
}
