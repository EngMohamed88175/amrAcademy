import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';




Future<void> showMessage(BuildContext context, String message,
    {bool isError = true, VoidCallback? onConfimTapped}) async {
  final completer = Completer<void>();
  QuickAlert.show(
    context: context,
    type: isError ? QuickAlertType.error : QuickAlertType.success,
    title: isError ? "Oops......" : null,
    confirmBtnColor: isError ? ColorsManger.red : ColorsManger.green,
    onConfirmBtnTap: onConfimTapped,
    text: message,
  );
  return completer.future;
  

}


