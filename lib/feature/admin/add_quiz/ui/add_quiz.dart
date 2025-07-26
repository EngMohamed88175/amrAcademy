import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';
import 'package:schoolacademy/core/utils/function/dialoge_error.dart';
import 'package:schoolacademy/feature/admin/add_quiz/widget/option_add_quiz.dart';
import 'package:schoolacademy/feature/admin/add_quiz/logic/cubit/add_quiz_cubit.dart';
import 'package:schoolacademy/core/utils/widgets/main_button_local/main_button_locald.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class AddQuizScreen extends StatelessWidget {
  const AddQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddQuizCubit(),
      child: BlocBuilder<AddQuizCubit, AddQuizState>(
        builder: (context, state) {
          final cubit = context.read<AddQuizCubit>();
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 100.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'أضافة الأسئلة',
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    centerTitle: true,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        OptionAddQuiz(
                          text: 'اضف السؤال الخاص بك',
                          hitText: 'اضف السؤال الخاص بك',
                          controller: cubit.option0Cont,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        OptionAddQuiz(
                          text: 'الأجابة الأولي',
                          hitText: 'الأجابة الأولي',
                          controller: cubit.option1Cont,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        OptionAddQuiz(
                          text: 'الأختيار الثاني',
                          hitText: 'الأختيار الثاني',
                          controller: cubit.option2Cont,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        OptionAddQuiz(
                          text: 'الأختيار الثالث',
                          hitText: 'الأختيار الثالث',
                          controller: cubit.option3Cont,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        OptionAddQuiz(
                          text: 'الأختيار الرابع',
                          hitText: 'الأختيار الرابع',
                          controller: cubit.option4Cont,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        OptionAddQuiz(
                          text: 'الأجابة الصحيحة',
                          hitText: 'الأجابة الصحيحة',
                          controller: cubit.correcrtAnswer,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        OptionAddQuiz(
                          text: 'أدخل درجه السؤال',
                          hitText: 'أدخل درجه السؤال',
                          controller:
                              cubit.scoreCont, // إضافة التحكم لهذا الحقل
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "أختيار الصف المراد اضافة اليه الامتحان",
                          style: StylesManager.styleBold20(context).copyWith(
                              color: ColorsManger.black, fontSize: 20.sp),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 7.w),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: ColorsManger.gray.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  items: cubit.grades
                                      .map((items) => DropdownMenuItem<String>(
                                          value: items,
                                          child: Text(
                                            items,
                                            style: StylesManager.styleBold20(
                                                    context)
                                                .copyWith(
                                                    color: ColorsManger.black,
                                                    fontSize: 14.sp),
                                          )))
                                      .toList(),
                                  dropdownColor: ColorsManger.white,
                                  borderRadius: BorderRadius.circular(15.sp),
                                  hint: const Text("Select Grade"),
                                  iconSize: 16.sp,
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: ColorsManger.black,
                                  ),
                                  value: cubit.selectedGrade,
                                  onChanged: (value) {
                                    cubit.changeGrades(value!);
                                  }),
                            )),
                        SizedBox(
                          height: 2.h,
                        ),
                        MainButtonLocal(
                            width: 20.w,
                            height: 7.h,
                            borderRadius: 10.sp,
                            fontSizeText: 18.sp,
                            fontSizeIcon: 0,
                            text: "Add",
                            textColor: ColorsManger.white,
                            isIconColor: false,
                            onTap: () {
                              cubit.uploadItem(context);
                            },
                            backgroundColor: ColorsManger.primaryColor,
                            isBorder: false,
                            isIcon: false),
                        SizedBox(height: 4.h),
                        MainButtonLocal(
                          width: 20.w,
                          height: 7.h,
                          borderRadius: 10.sp,
                          fontSizeText: 18.sp,
                          fontSizeIcon: 0,
                          text: "إلغاء الامتحان",
                          textColor: ColorsManger.white,
                          isIconColor: false,
                          onTap: () {
                            if (cubit.selectedGrade != null) {
                              cubit.cancelQuiz(
                                context,
                              );
                            } else {
                              showMessage(
                                  context, "اختر الصف المراد إلغاء الامتحان له",
                                  isError: true);
                            }
                          },
                          backgroundColor: ColorsManger.red,
                          isBorder: false,
                          isIcon: false,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
