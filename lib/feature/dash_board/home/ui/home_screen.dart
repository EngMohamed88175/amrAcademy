import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:screen_go/extensions/screen_type_value.dart';
import 'package:schoolacademy/feature/dash_board/home/widget/header_text.dart';
import 'package:schoolacademy/feature/dash_board/home/logic/cubit/home_cubit.dart';
import 'package:schoolacademy/feature/dash_board/home/widget/why_choose_mr_amr.dart';
import 'package:schoolacademy/feature/dash_board/home/widget/header_home_widget.dart';
import 'package:schoolacademy/feature/dash_board/home/widget/animated_text_widget.dart';
import 'package:schoolacademy/feature/dash_board/home/widget/card_items_book_widget.dart';
import 'package:schoolacademy/feature/dash_board/home/widget/classes/class_home_widget.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final double width = screenSize.width;
    final double height = screenSize.height;

    return BlocProvider(
      create: (context) => HomeCubit()..fetchInitialData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            // drawer: CustomDrawer(),
            body: CustomScrollView(
              controller: context.read<HomeCubit>().scrollController,
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      // ======= شريط الأدوات =======
                      HeaderHomeWidget(),

                      // SizedBox(height: 5.h),

                      // ======= صورة الهيدر =======
                      AnimatedTextWidget(),

                      SizedBox(height: 5.h),

                      // ======= لماذا تختار مستر عمرو =======
                      WhyChooseMrAmr(isMobile: width < 768, containerCount: 2),

                      SizedBox(height: height * 0.1),

                      // ======= الصفوف الدراسية =======
                      const HeaderText(
                          text: "الصفوف",
                          subtText: ' الدراســـــــــــــــــية'),

                      SizedBox(height: 5.h),

                      ClassesHomeWidget(),

                      SizedBox(height: 10.h),

                      // ======= الكتب الدراسية =======
                      const HeaderText(
                          text: '  الكتب ',
                          subtText: ' الدراســــــيـــــــــــة'),

                      // SizedBox(height: 5.h),
                      // Padding(
                      //   padding: EdgeInsets.all(20.0.sp),
                      //   child: Container(
                      //     height: 100.h,
                      //     decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //         image: AssetImage(
                      //             "assets/images/jpg/detaileds.webp"),
                      //         fit: BoxFit.cover,
                      //       ),
                      //       borderRadius: BorderRadius.circular(10
                      //           .sp), // Adjust the radius for rounded corners
                      //     ),
                      //   ),
                      // ),

                      CardItemsBookDeskTopWidget(
                          height: stv(
                              context: context,
                              mobile: 45.h,
                              tablet: 50.h,
                              desktop: 45.h),
                          width: stv(
                              context: context,
                              mobile: 80.w,
                              tablet: 80.w,
                              desktop: 40.w)),

                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<HomeCubit>().openWhatsApp();
              },
              backgroundColor: Color(0xFF25D366),
              child: Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
