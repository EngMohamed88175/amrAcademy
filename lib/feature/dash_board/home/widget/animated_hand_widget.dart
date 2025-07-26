import 'package:flutter/material.dart';
import 'package:schoolacademy/core/utils/constant/image_assets.dart';
import 'package:schoolacademy/core/utils/helper/app_image_helper.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class AnimatedHandWidget extends StatelessWidget {
  final double top;
  final double right;
  final double widthImage;
  final double heightImage;
  final TextStyle styleOneText;
  final TextStyle styleTwoText;
  final TextStyle stylethreeText;
  final String text;
  const AnimatedHandWidget({
    super.key,
    required this.top,
    required this.right,
    required this.widthImage,
    required this.heightImage,
    required this.styleOneText,
    required this.styleTwoText,
    required this.stylethreeText,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              AppImageHelper(
                path: ImageAssetsManger.handwave,
                width: widthImage,
                height: heightImage,
              ),
              Text(
                "مــــستر عمرو عارف",
                style: styleOneText,
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "مدرس أول لغة عربية\n", style: styleTwoText),
                TextSpan(text: text, style: stylethreeText),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
