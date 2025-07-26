import 'package:flutter/material.dart';
import 'package:schoolacademy/core/utils/constant/image_assets.dart';
import 'package:schoolacademy/core/utils/helper/app_image_helper.dart';

class ProfileImageOverlay extends StatelessWidget {
  const ProfileImageOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          top: 108,
          child: AppImageHelper(
            path: ImageAssetsManger.amr,
            height: 650,
          ),
        ),
        Positioned(
          top: 100,
          right: 200,
          child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(ImageAssetsManger.amrtwo),
          ),
        ),
      ],
    );
  }
}
