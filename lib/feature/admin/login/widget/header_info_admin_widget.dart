import 'package:flutter/material.dart';



class AdminHeaderInfoWidget extends StatelessWidget {
  final String title;
  final String description;
  final TextStyle style;
  final TextStyle styleTwo;
  const AdminHeaderInfoWidget({
    super.key,
    required this.title,
    required this.description,
    required this.style,
    required this.styleTwo,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: title,
              style: style),
          TextSpan(
              text: description,
              style: styleTwo),
        ],
      ),
    );
  }
}
