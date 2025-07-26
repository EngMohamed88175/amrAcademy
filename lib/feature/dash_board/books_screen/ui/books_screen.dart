import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolacademy/core/utils/extensions/navigate.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:screen_go/functions/screen_type_value_func.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/constant/image_assets.dart';
import 'package:schoolacademy/core/utils/function/choose_books.dart';
import 'package:schoolacademy/core/utils/helper/app_image_helper.dart';
import 'package:schoolacademy/feature/dash_board/home/data/model/book_scool_grade.dart';
import 'package:schoolacademy/feature/dash_board/books_screen/logic/cubit/books_cubit.dart';

class BooksScreen extends StatelessWidget {
  final BookScoolGradeModel bookScoolGrade;

  const BooksScreen({super.key, required this.bookScoolGrade});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksCubit()..fetchBooks(),
      child: BlocBuilder<BooksCubit, BooksState>(
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                // ✅ الصورة في الأعلى تمامًا مع حواف دائرية
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 5.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.sp),
                          ),
                          child: AppImageHelper(
                            path: bookScoolGrade.bookNameGrade ==
                                    "الصفوف الإبتدائية"
                                ? ImageAssetsManger.book1
                                : ImageAssetsManger.book2,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      // ✅ زر الرجوع في الجانب العلوي الأيسر
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 5,
                        left: 2.w,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorsManger.gray[200],
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: ColorsManger.black,
                              size: 18.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // ✅ الشبكة الخاصة بالكتب
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final bookName = bookScoolGrade.nameGradeBook[index];
                        return InkWell(
                          onTap: () {
                            chooseBook(context, index,
                                bookScoolGrade: bookScoolGrade);
                          },
                          child: Card(
                            color: ColorsManger.white,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: AppImageHelper(
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    path: "assets/images/jpg/classes1.jpg",
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    bookName,
                                    style: TextStyle(
                                      fontSize: stv(
                                          context: context,
                                          mobile: 16.sp,
                                          tablet: 16.sp,
                                          desktop: 14.sp),
                                      fontWeight: FontWeight.bold,
                                      color: ColorsManger.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: bookScoolGrade.nameGradeBook.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: stv(
                          context: context, mobile: 1, tablet: 2, desktop: 3),
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.9,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
