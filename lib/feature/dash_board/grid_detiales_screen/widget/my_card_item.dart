import 'package:flutter/material.dart';
import 'package:schoolacademy/core/Routes/routes.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:screen_go/functions/screen_type_value_func.dart';
import 'package:schoolacademy/core/utils/extensions/navigate.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';
import 'package:schoolacademy/core/utils/helper/app_image_helper.dart';

class MyCardItem extends StatefulWidget {
  final String imageUrl;
  final String nameTeacher;
  final String description;
  final String videoUrl;
  final String nameGrade;

  const MyCardItem({
    super.key,
    required this.imageUrl,
    required this.nameTeacher,
    required this.description,
    required this.videoUrl,
    required this.nameGrade,
  });

  @override
  State<MyCardItem> createState() => _MyCardItemState();
}

class _MyCardItemState extends State<MyCardItem> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        context.pushNamed(
          Routes.video,
          arguments: [widget.videoUrl, widget.description],
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة الكورس مع تأثير الظل
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Stack(
                  children: [
                    AppImageHelper(
                      path: widget.imageUrl,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.sp, vertical: 4.sp),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.video_collection,
                                color: Colors.white, size: 16.sp),
                            SizedBox(width: 5),
                            Text(
                              'مشاهدة الكورس',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // اسم المعلم
                  Text(
                    widget.nameTeacher,
                    style: StylesManager.style23Bold(context).copyWith(
                      fontSize: stv(
                        context: context,
                        mobile: 18.sp,
                        tablet: 20.sp,
                        desktop: 16.sp,
                      ),
                      color: Colors.blue.shade700,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 5),

                  // وصف الكورس مع تأثير جمالي
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: stv(
                        context: context,
                        mobile: 16.sp,
                        tablet: 18.sp,
                        desktop: 14.sp,
                      ),
                      color: Colors.grey.shade700,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 3.h),

                  // زر العرض
                  MouseRegion(
                    onEnter: (_) => setState(() => _isHovered = true),
                    onExit: (_) => setState(() => _isHovered = false),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          context.pushNamed(
                            Routes.video,
                            arguments: [widget.videoUrl, widget.description],
                          );
                        },
                        icon: Icon(
                          Icons.play_arrow,
                          color: ColorsManger.white,
                        ),
                        label: Text('ابدأ المشاهدة'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              _isHovered ? Colors.red : Colors.blue.shade600,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
