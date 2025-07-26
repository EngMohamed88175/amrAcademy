import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/function/dotted_line_painter.dart';
import 'package:schoolacademy/feature/dash_board/question_screen/logic/cubit/question_cubit.dart';
import 'package:schoolacademy/feature/dash_board/question_screen/widget/question_item_widget.dart';

class QuestionListWidget extends StatelessWidget {
  final List<DocumentSnapshot> questions;
  final bool isExamCompleted;
  final List<bool> showAnswers;
  final Function(int index, String answer) onAnswerSelected;

  const QuestionListWidget({
    super.key,
    required this.questions,
    required this.isExamCompleted,
    required this.showAnswers,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: questions.length * 2 - 1,
      itemBuilder: (context, index) {
        if (index.isOdd) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 1),
              painter: DottedLinePainter(),
            ),
          );
        }

        int quizIndex = index ~/ 2;
        DocumentSnapshot ds = questions[quizIndex];

        return QuestionItemWidget(
          question: ds,
          isExamCompleted: isExamCompleted,
          showAnswer: showAnswers[quizIndex],
          onTap: () {
            context.read<QuestionCubit>().toggleShowAnswer(quizIndex);
          },
          onAnswerSelected: (answer) {
            onAnswerSelected(quizIndex, answer);
          },
        );
      },
    );
  }
}
