import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolacademy/core/Routes/routes.dart';
import 'package:screen_go/enums/screen_type_enums.dart';
import 'package:screen_go/functions/get_screen_type_func.dart';
import 'package:schoolacademy/core/utils/extensions/navigate.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/constant/image_assets.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';
import 'package:schoolacademy/core/utils/helper/app_image_helper.dart';
import 'package:schoolacademy/feature/dash_board/home/logic/cubit/home_cubit.dart';
import 'package:schoolacademy/core/utils/widgets/custom_ciecular_indicator_loading_widget/custom_circule_indicator_loading_widget.dart';

class CardItemsBookDeskTopWidget extends StatelessWidget {
  final double height;
  final double width;

  const CardItemsBookDeskTopWidget({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final screenType = getScreenType(MediaQuery.of(context));

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          final books = state.books;

          return screenType == DeviceScreenType.desktop
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(books.length, (index) {
                    return InkWell(
                      onTap: () {
                        context.pushNamed(
                          Routes.booksScreen,
                          arguments: books[index],
                        );
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SizedBox(
                          height: height,
                          width: width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Column(
                              children: [
                                const Expanded(
                                  child: AppImageHelper(
                                    width: double.infinity,
                                    path: ImageAssetsManger.book,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    books[index].bookNameGrade,
                                    style: StylesManager.styleBold20ReemKufi(
                                            context)
                                        .copyWith(
                                            fontSize: 22,
                                            color: ColorsManger.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(books.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: InkWell(
                        onTap: () {
                          context.pushNamed(
                            Routes.booksScreen,
                            arguments: books[index],
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: SizedBox(
                            height: height,
                            width: width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Column(
                                children: [
                                  const Expanded(
                                    child: AppImageHelper(
                                      width: double.infinity,
                                      path: ImageAssetsManger.book,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      books[index].bookNameGrade,
                                      style: StylesManager.styleBold20ReemKufi(
                                              context)
                                          .copyWith(
                                              fontSize: 22,
                                              color: ColorsManger.black),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                );
        } else if (state is HomeLoading) {
          return const Center(child: IndicatorLoading());
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No books available.'));
        }
      },
    );
  }
}
