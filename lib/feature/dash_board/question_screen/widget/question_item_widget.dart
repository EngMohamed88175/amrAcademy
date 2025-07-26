import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/constant/change_translate_and_theme.dart';
import 'package:schoolacademy/feature/dash_board/question_screen/widget/poin_exam.dart';

class QuestionItemWidget extends StatelessWidget {
  final DocumentSnapshot question;
  final bool isExamCompleted;
  final bool showAnswer;
  final VoidCallback onTap;
  final Function(String answer) onAnswerSelected;

  const QuestionItemWidget({
    super.key,
    required this.question,
    required this.isExamCompleted,
    required this.showAnswer,
    required this.onTap,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    final data = question.data() as Map<String, dynamic>?;
    final questionText = data?.containsKey("option0") == true
        ? data!["option0"]
        : 'No Question Text';
    final points = data?.containsKey("score") == true ? data!["score"] : 0;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: ColorsManger.gray, width: 1.5),
          borderRadius: BorderRadius.circular(12.sp),
        ),
        elevation: 12,
        shadowColor: Colors.black.withOpacity(0.8),
        margin: EdgeInsets.all(3.sp),
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(right: 5.w, top: 1.h),
                width: double.infinity,
                height: 10.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: ColorsManger.black.withOpacity(0.8),
                  border: const Border(
                    right: BorderSide(
                      color: ColorsManger.primaryColor,
                      width: 5,
                    ),
                  ),
                ),
                child: PoitExam(points: points, questionText: questionText),
              ),
              SizedBox(height: 2.h),
              ...["option1", "option2", "option3", "option4"].map((optionKey) {
                return InkWell(
                  onTap: isExamCompleted
                      ? null
                      : () {
                          onAnswerSelected(data?[optionKey] as String);
                          onTap();
                        },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: (isExamCompleted || showAnswer)
                            ? (data?.containsKey("correct") == true &&
                                    data!["correct"] == data[optionKey]
                                ? ColorsManger.green
                                : ColorsManger.red)
                            : ColorsManger.transparent,
                        border: Border.all(color: ColorsManger.gray),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.sp),
                        child: Text(
                          data?.containsKey(optionKey) == true
                              ? data![optionKey]
                              : 'No Option',
                          style: StylesManager.style22Bold(context).copyWith(
                            color: (isExamCompleted || showAnswer)
                                ? (data?.containsKey("correct") == true &&
                                        data!["correct"] == data[optionKey]
                                    ? ColorsManger.white
                                    : ColorsManger.white)
                                : ChangeTheme.isDarkMode(context)
                                    ? ColorsManger.white
                                    : ColorsManger.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
