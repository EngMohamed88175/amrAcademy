import 'package:flutter/material.dart';
import 'package:schoolacademy/core/utils/helper/app_image_helper.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first


class MainButtonLocal extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final double fontSizeText;
  final double fontSizeIcon;
  final String text;
  final Color? backgroundColor; 
  final Color textColor;
  final Color? iconColor;
  final bool isIconColor;
  final BoxBorder? border;
  final VoidCallback onTap;
  final bool isBorder;
  final bool isIcon;
  final IconData? icon;
  final String? image;
  final Gradient? gradient; 

  const MainButtonLocal({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.fontSizeText,
    required this.fontSizeIcon,
    required this.text,
    this.backgroundColor,
    required this.textColor,
     this.iconColor,
    required this.isIconColor,
    this.border,
    required this.onTap,
    required this.isBorder,
    required this.isIcon,
    this.icon,
    this.image,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient,
          color: gradient == null
              ? backgroundColor
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
          border: isBorder ? border : null,
        ),
        child: (isIcon || (image != null && image!.isNotEmpty))
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (isIcon)
                    Icon(
                      icon,
                      size: fontSizeIcon,
                      color: isIconColor == true ?  iconColor : null,
                    )
                  else if (image != null && image!.isNotEmpty)
                    AppImageHelper(path: image!),
                  Text(
                    text,
                    style: TextStyle(fontSize: fontSizeText, color: textColor),
                  ),
                ],
              )
            : Center(
                child: Text(
                  text,
                  style: TextStyle(fontSize: fontSizeText, color: textColor),
                ),
              ),
      ),
    );
  }
}
