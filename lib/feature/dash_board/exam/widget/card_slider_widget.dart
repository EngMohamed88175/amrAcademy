import 'package:flutter/material.dart';
import 'package:schoolacademy/core/Routes/routes.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/extensions/navigate.dart';

class CardSliderWidget extends StatelessWidget {
  final String gradeTitle;

  const CardSliderWidget({super.key, required this.gradeTitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.questionScreen, arguments: gradeTitle);
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://media.istockphoto.com/id/1496817603/photo/high-resolution-luxury-abstract-fluid-art-painting-in-alcohol-ink-technique-mixture-of-black.jpg?s=1024x1024&w=is&k=20&c=Hflfsi633V6i6aIY9Fet3bcJBFdgVmHlddLr-8DHKmg=',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 5.sp,
                horizontal: 10.sp,
              ),
              color: Colors.black.withOpacity(0.5),
              child: Text(
                gradeTitle,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
