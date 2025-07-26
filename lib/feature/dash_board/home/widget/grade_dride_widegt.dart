import 'package:flutter/material.dart';
import 'package:screen_go/extensions/screen_type_value.dart';
import 'package:schoolacademy/feature/dash_board/home/widget/grade_exam_items.dart';
import 'package:schoolacademy/feature/dash_board/home/data/model/classes_model.dart';

class GradeGridWidget extends StatelessWidget {
  final String stage;
  final List<ClassesGradePrimaryModel> classes;
  final String path;

  const GradeGridWidget({
    super.key,
    required this.stage,
    required this.classes,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: stv(context: context, mobile: 1, tablet: 2, desktop: 3),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: classes.length,
      itemBuilder: (context, index) {
        return GradeExamItemsStudent(
          gradeTitle: classes[index].nameGrade,
          stage: stage,
          classData: classes[index],
          path: path,
        );
      },
    );
  }
}
