import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';

Future<dynamic> showScoreDialoge(BuildContext context, int totalScore) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('نتيجتك النهائية'),
        content: Text('حصلت على $totalScore درجة.'),
        actions: [
          Container(
            decoration: BoxDecoration(
                color: ColorsManger.primaryColor,
                borderRadius: BorderRadius.circular(15.sp)),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'إغلاق',
                style: TextStyle(color: ColorsManger.white),
              ),
            ),
          ),
        ],
      );
    },
  );
}
