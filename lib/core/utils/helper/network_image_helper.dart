import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/widgets/custom_ciecular_indicator_loading_widget/custom_circule_indicator_loading_widget.dart';

class NetworkImageHelper extends StatelessWidget {
  final String imageUrl;
  final double width;
  final BoxFit fit;
  final double height;

  const NetworkImageHelper({
    super.key,
    required this.imageUrl,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
    this.height = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => const IndicatorLoading(),
      errorWidget: (context, url, error) {
        debugPrint("Image load failed for URL: $url, error: $error");
        return const Center(
          child: Icon(
            Icons.error,
            color: ColorsManger.red,
          ),
        );
      },
    );
  }
}
