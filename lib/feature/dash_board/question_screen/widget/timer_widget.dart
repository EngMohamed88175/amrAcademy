import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/constant/change_translate_and_theme.dart';

class TimerProgressBarWidget extends StatefulWidget {
  final Duration remainingTime;
  final Duration totalDuration;

  const TimerProgressBarWidget({super.key, required this.remainingTime, required this.totalDuration});

  @override
  State<TimerProgressBarWidget> createState() => _TimerProgressBarWidgetState();
}

class _TimerProgressBarWidgetState extends State<TimerProgressBarWidget> {
  @override
  Widget build(BuildContext context) {
    double progress = 1 - (widget.remainingTime.inSeconds / widget.totalDuration.inSeconds);
    progress = progress.clamp(0.0, 1.0);

    return Container(
      height: 10.h,
      width: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ChangeTheme.isDarkMode(context) ? ColorsManger.white : ColorsManger.gray,
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: progress * 80.w,
                decoration: const BoxDecoration(
                  color: ColorsManger.primaryColor,
                ),
              ),
            ),
            Center(
              child: Text(
                _formatTime(widget.remainingTime),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: ChangeTheme.isDarkMode(context) ? ColorsManger.white : ColorsManger.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
