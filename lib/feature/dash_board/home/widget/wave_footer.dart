import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class WaveFooter extends StatelessWidget {
  final String text;
  final String title;
  final String subTitle;
  final TextStyle styleOne;
  final TextStyle styleTwo;
  final TextStyle styleThree;

  const WaveFooter({
    super.key,
    required this.text,
    required this.title,
    required this.subTitle,
    required this.styleOne,
    required this.styleTwo,
    required this.styleThree,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.w,
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: styleOne,
          ),
          const SizedBox(height: 8),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: title,
              style: styleTwo,
              children: <TextSpan>[
                TextSpan(
                  text: subTitle,
                  style: styleThree,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
