import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schoolacademy/core/Routes/routes.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:schoolacademy/core/utils/extensions/navigate.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';
import 'package:schoolacademy/core/utils/helper/app_image_helper.dart';
import 'package:schoolacademy/core/utils/function/show_score_dialoge.dart';
import 'package:schoolacademy/core/utils/constant/change_translate_and_theme.dart';
import 'package:schoolacademy/feature/dash_board/question_screen/widget/timer_widget.dart';
import 'package:schoolacademy/feature/dash_board/question_screen/logic/cubit/question_state.dart';
import 'package:schoolacademy/feature/dash_board/question_screen/logic/cubit/question_cubit.dart';
import 'package:schoolacademy/feature/dash_board/question_screen/widget/submit_button_widget.dart';
import 'package:schoolacademy/feature/dash_board/question_screen/widget/question_list_widget.dart';

class QuestionScreen extends StatefulWidget {
  final String category;

  const QuestionScreen({super.key, required this.category});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late Timer _timer;
  Duration _remainingTime = const Duration(minutes: 30);
  bool _isExamCompleted = false;
  List<String> _userAnswers = [];

  @override
  void initState() {
    super.initState();
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId != null) {
      _checkExamStatus(userId).then((_) {
        if (_isExamCompleted) {
          _timer.cancel();
        } else {
          _startTimer();
        }
      });
    }

    _userAnswers = List.filled(100, '');
  }

  Future<void> setExamCompleted(String category, String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('${category}_exam_completed_$userId', true);
  }

  Future<bool> isExamCompleted(String category, String userId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('${category}_exam_completed_$userId') ?? false;
  }

  Future<void> _checkExamStatus(String userId) async {
    final isCompleted = await isExamCompleted(widget.category, userId);
    setState(() {
      _isExamCompleted = isCompleted;
    });
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds <= 1) {
        _timer.cancel();
        Future.delayed(const Duration(seconds: 3), () {
          context.pushNamed(Routes.examScreen);
        });
      } else {
        setState(() {
          _remainingTime = _remainingTime - const Duration(seconds: 1);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubit()..fetchQuestions(widget.category),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // ✅ إضافة TimerProgressBarWidget أعلى القائمة
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: ChangeTheme.isDarkMode(context)
                          ? ColorsManger.white
                          : ColorsManger.black,
                    ),
                    onPressed: () {
                      context.pushNamedAndRemoveUntil(Routes.homeScreen,
                          predicate: (Route<dynamic> route) {
                        return false;
                      });
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: TimerProgressBarWidget(
                        remainingTime: _remainingTime,
                        totalDuration: const Duration(minutes: 30),
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: BlocBuilder<QuestionCubit, QuestionState>(
                  builder: (context, state) {
                    if (state is QuestionLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is QuestionLoaded) {
                      if (state.questions.isEmpty) {
                        return const Center(
                          child: AppImageHelper(
                            path: "assets/images/json/empty_exam.json",
                          ),
                        );
                      }

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: QuestionListWidget(
                              questions: state.questions,
                              isExamCompleted: _isExamCompleted,
                              showAnswers: state.showAnswers,
                              onAnswerSelected: (index, answer) {
                                setState(() {
                                  _userAnswers[index] = answer;
                                });
                              },
                            ),
                          ),
                          if (!_isExamCompleted)
                            SubmitButtonWidget(
                              onTap: () async {
                                setState(() {
                                  _timer.cancel();
                                });

                                final userId =
                                    FirebaseAuth.instance.currentUser?.uid;

                                if (userId != null) {
                                  await setExamCompleted(
                                      widget.category, userId);
                                }

                                final totalScore = context
                                    .read<QuestionCubit>()
                                    .calculateScore(
                                        state.questions, _userAnswers);

                                showScoreDialoge(context, totalScore);
                              },
                            ),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
