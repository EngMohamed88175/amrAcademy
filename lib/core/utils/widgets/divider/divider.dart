import 'package:flutter/material.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first


class DividerWidget extends StatelessWidget {
  final double endIndent;
  final double indent;
  final double endIndentT;
  final double indentT;
  const DividerWidget({
    super.key,
    required this.endIndent,
    required this.indent,
    required this.endIndentT,
    required this.indentT,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: ColorsManger.black, // لون الخط
            thickness: 1, // سمك الخط
            endIndent: endIndent,
            indent: indent,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child:  Text('OR'),
        ),
        Expanded(
          child: Divider(
            color: ColorsManger.black, // لون الخط
            thickness: 1, // سمك الخط
              endIndent: endIndentT,
            indent: indentT,
          ),
        ),
      ],
    );
  }
}
