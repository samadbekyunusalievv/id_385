import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/book_question.dart';
import 'custom_answer_button.dart';

class QuestionWidget extends StatelessWidget {
  final BookQuestion currentQuestion;
  final List<String> options;
  final bool isAnswered;
  final bool isCorrect;
  final String? selectedAnswer;
  final Function(String) onSelectAnswer;
  final VoidCallback onNextQuestion;
  final int currentQuestionIndex;
  final int totalQuestions;

  QuestionWidget({
    required this.currentQuestion,
    required this.options,
    required this.isAnswered,
    required this.isCorrect,
    required this.selectedAnswer,
    required this.onSelectAnswer,
    required this.onNextQuestion,
    required this.currentQuestionIndex,
    required this.totalQuestions,
  });

  Color _getButtonColor(String option) {
    if (isAnswered && option == selectedAnswer) {
      return isCorrect
          ? Color.fromRGBO(0, 174, 59, 1)
          : Color.fromRGBO(212, 35, 56, 1);
    }
    return Color.fromRGBO(169, 128, 187, 1);
  }

  Color _getButtonBorderColor(String option) {
    if (isAnswered && option == selectedAnswer) {
      return isCorrect
          ? Color.fromRGBO(15, 90, 36, 1)
          : Color.fromRGBO(95, 3, 14, 1);
    }
    return Color.fromRGBO(119, 82, 135, 1);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        final offsetAnimation = Tween<Offset>(
          begin: Offset(1.0, 0.0),
          end: Offset(0.0, 0.0),
        ).animate(animation);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      child: Column(
        key: ValueKey<int>(currentQuestionIndex),
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 15.h),
                  Image.asset(
                    isAnswered
                        ? (isCorrect
                            ? 'assets/images/book1.png'
                            : 'assets/images/book2.png')
                        : 'assets/images/book.png',
                    height: 159.h,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: isAnswered ? 45.h : 10.h),
                  Text(
                    isAnswered
                        ? (isCorrect
                            ? "That's the right answer!"
                            : "This is the wrong answer...")
                        : currentQuestion.description,
                    style: GoogleFonts.crimsonText(
                      textStyle: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.1.h,
                        color: Colors.black,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isAnswered ? 51.h : 15.h),
                  if (isAnswered && isCorrect) ...[
                    CustomAnswerButton(
                      text: currentQuestion.answer,
                      onPressed: null,
                      backgroundColor: Color.fromRGBO(0, 174, 59, 1),
                      borderBottomColor: Color.fromRGBO(15, 90, 36, 1),
                    ),
                    SizedBox(height: 45.h),
                    Text(
                      '${currentQuestion.author}, ${currentQuestion.year}',
                      style: GoogleFonts.crimsonText(
                        textStyle: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.1,
                          color: Colors.black,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 140.h),
                  ] else ...[
                    Column(
                      children: options.map((option) {
                        return Column(
                          children: [
                            CustomAnswerButton(
                              text: option,
                              onPressed: isAnswered
                                  ? null
                                  : () => onSelectAnswer(option),
                              backgroundColor: _getButtonColor(option),
                              borderBottomColor: _getButtonBorderColor(option),
                            ),
                            SizedBox(height: 14.h),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                  SizedBox(height: 15.h),
                  Text(
                    'Question ${currentQuestionIndex + 1} of $totalQuestions',
                    style: GoogleFonts.crimsonText(
                      textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.1,
                        color: Colors.black,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  if (isAnswered)
                    SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(85, 73, 209, 1),
                          borderRadius: BorderRadius.circular(2.r),
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(34, 22, 158, 1),
                              width: 3,
                            ),
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: onNextQuestion,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Next question',
                                style: TextStyle(
                                  height: 26.h / 20.h,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.r,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                                size: 20.r,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
