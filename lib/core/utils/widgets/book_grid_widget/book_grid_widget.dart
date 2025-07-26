import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:screen_go/functions/screen_type_value_func.dart';
import 'package:schoolacademy/core/utils/helper/app_image_helper.dart';

class BooksGridWidget extends StatelessWidget {
  final List<String> bookNames;
  final List<String> bookIds;
  final Function(int index) onBookTap;
  final int crossAxisCount;
  final double gridHeightFactor;
  final String imagePath;

  const BooksGridWidget({
    super.key,
    required this.bookNames,
    required this.bookIds,
    required this.onBookTap,
    required this.crossAxisCount,
    required this.gridHeightFactor,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          mainAxisExtent: MediaQuery.of(context).size.height * gridHeightFactor,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return InkWell(
              onTap: () => onBookTap(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      Hero(
                        tag: bookIds[index],
                        child: AppImageHelper(
                          path: imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height *
                              gridHeightFactor,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                            ),
                            child: Text(
                              bookNames[index],
                              style: TextStyle(
                                fontSize: stv(
                                    context: context,
                                    mobile: 18.sp,
                                    tablet: 18.sp,
                                    desktop: 16.sp),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          childCount: bookIds.length,
        ),
      ),
    );
  }
}
