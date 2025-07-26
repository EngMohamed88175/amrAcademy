import 'package:url_launcher/url_launcher.dart';
import 'package:schoolacademy/core/utils/constant/style_manger.dart';
import 'package:schoolacademy/feature/dash_board/home/data/model/book_scool_grade.dart';
  import 'package:flutter/material.dart';

Future<dynamic> chooseBook(BuildContext context, int index , {
  required BookScoolGradeModel bookScoolGrade,
}) {
    return showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  title: const Center(
                                      child: Text('اختر الكتاب المناسب لك')),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF800020),
                                            padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 24,
                                                    vertical: 12),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                            ),
                                          ),
                                          onPressed: () async {
                                            final Uri url = Uri.parse(
                                                bookScoolGrade
                                                    .linkBookAladwaa[index]);
                                            if (await canLaunchUrl(url)) {
                                              await launchUrl(url,
                                                  mode: LaunchMode
                                                      .externalApplication); // فتح الرابط
                                            } else {
                                              // ignore: use_build_context_synchronously
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        'لا يمكن فتح الرابط ${bookScoolGrade.linkBookAladwaa[index]}')),
                                              );
                                            }
                                            // ignore: use_build_context_synchronously
                                            Navigator.of(context)
                                                .pop(); // إغلاق الديالوج
                                          },
                                          child: Text(
                                            bookScoolGrade
                                                .chooseBookStudent[0],
                                            style:
                                                StylesManager.styleSemiBold18(
                                                    context),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 11,
                                                    vertical: 4),
                                            backgroundColor:
                                                const Color(0xFF800020),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                            ),
                                          ),
                                          onPressed: () async {
                                            final Uri url = Uri.parse(
                                              bookScoolGrade
                                                      .linkBookStudentWeapon[
                                                  index],
                                            );
                                            if (await canLaunchUrl(url)) {
                                              await launchUrl(url,
                                                  mode: LaunchMode
                                                      .externalApplication); // فتح الرابط
                                              // ignore: use_build_context_synchronously
                                              Navigator.of(context).pop();
                                            } else {
                                              // ignore: use_build_context_synchronously
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        'لا يمكن فتح الرابط ${bookScoolGrade.linkBookStudentWeapon[1]}')),
                                              );
                                            }
                                          },
                                          child: Text(
                                            bookScoolGrade
                                                .chooseBookStudent[1],
                                            style:
                                                StylesManager.styleSemiBold18(
                                                    context),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              },
                            );
  }
