import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/book_questions.dart';
import '../models/book_question.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/exit_dialog.dart';
import '../widgets/premium_bottom_sheet.dart';
import '../widgets/question_widget.dart';
import '../widgets/result_widget.dart';
import '../widgets/stars_overlay.dart';

class SynopsisScreen extends StatefulWidget {
  @override
  _SynopsisScreenState createState() => _SynopsisScreenState();
}

class _SynopsisScreenState extends State<SynopsisScreen> {
  int totalQuestions = 50;
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  bool isAnswered = false;
  String? selectedAnswer;
  List<String> options = [];
  bool isCorrect = false;
  int answerCount = 0;

  @override
  void initState() {
    super.initState();
    if (bookQuestions.length < totalQuestions) {
      totalQuestions = bookQuestions.length;
    }
    _loadSavedState();
  }

  Future<void> _loadSavedState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentQuestionIndex = prefs.getInt('currentQuestionIndex') ?? 0;
      correctAnswers = prefs.getInt('correctAnswers') ?? 0;
      isAnswered = prefs.getBool('isAnswered') ?? false;
      selectedAnswer = prefs.getString('selectedAnswer');
      isCorrect = prefs.getBool('isCorrect') ?? false;
      answerCount = prefs.getInt('answerCount') ?? 0;
    });
    loadQuestion();
  }

  Future<void> _saveState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentQuestionIndex', currentQuestionIndex);
    await prefs.setInt('correctAnswers', correctAnswers);
    await prefs.setBool('isAnswered', isAnswered);
    if (selectedAnswer != null) {
      await prefs.setString('selectedAnswer', selectedAnswer!);
    } else {
      await prefs.remove('selectedAnswer');
    }
    await prefs.setBool('isCorrect', isCorrect);
    await prefs.setInt('answerCount', answerCount);
  }

  Future<void> _clearSavedState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('currentQuestionIndex');
    await prefs.remove('correctAnswers');
    await prefs.remove('isAnswered');
    await prefs.remove('selectedAnswer');
    await prefs.remove('isCorrect');
    await prefs.remove('answerCount');
  }

  Future<void> _saveLastResult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int bestCorrectAnswers = prefs.getInt('bestCorrectAnswers') ?? 0;
    if (correctAnswers > bestCorrectAnswers) {
      await prefs.setInt('bestCorrectAnswers', correctAnswers);
    }
  }

  void loadQuestion() {
    if (currentQuestionIndex < totalQuestions) {
      BookQuestion currentQuestion = bookQuestions[currentQuestionIndex];

      List<String> wrongAnswers = List.from(additionalBooks)
        ..remove(currentQuestion.answer)
        ..shuffle();
      wrongAnswers = wrongAnswers.take(3).toList();

      options = List<String>.from(wrongAnswers)
        ..add(currentQuestion.answer)
        ..shuffle();

      setState(() {
        isAnswered = false;
        selectedAnswer = null;
        isCorrect = false;
      });
      _saveState();
    }
  }

  Future<bool> _checkPremiumStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isPremium') ?? false;
  }

  void selectAnswer(String answer) {
    if (isAnswered) return;

    BookQuestion currentQuestion = bookQuestions[currentQuestionIndex];
    bool correct = answer == currentQuestion.answer;

    setState(() {
      isAnswered = true;
      selectedAnswer = answer;
      isCorrect = correct;

      if (correct) {
        correctAnswers += 1;
      }

      answerCount += 1;
    });
    _saveState();

    if (answerCount % 2 == 0) {
      _checkPremiumStatus().then((isPremium) {
        if (!isPremium) {
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            backgroundColor: Colors.transparent,
            builder: (context) => PremiumBottomSheet(),
          );
        }
      });
    }
  }

  void nextQuestion() {
    setState(() {
      currentQuestionIndex += 1;
    });
    if (currentQuestionIndex < totalQuestions) {
      loadQuestion();
    }
    _saveState();
  }

  void resetGame() {
    _saveLastResult().then((_) {
      setState(() {
        currentQuestionIndex = 0;
        correctAnswers = 0;
        isAnswered = false;
        selectedAnswer = null;
        isCorrect = false;
        answerCount = 0;
        loadQuestion();
      });
      _clearSavedState();
    });
  }

  void exitGame() {
    _saveLastResult().then((_) {
      _clearSavedState();
      Navigator.pop(context);
    });
  }

  bool isGameOver() {
    return currentQuestionIndex >= totalQuestions;
  }

  Future<void> _handleLeave() async {
    await _saveLastResult();
    await _clearSavedState();
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  Future<void> _handleCancel() async {
    Navigator.of(context).pop();
  }

  Future<bool> _onWillPop() async {
    await showDialog(
      context: context,
      builder: (context) => ExitDialog(
        onLeave: _handleLeave,
        onCancel: _handleCancel,
      ),
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    bool gameOver = isGameOver();

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Synopsis',
          showBackButton: true,
          showSettingsIcon: true,
          onBackButtonPressed: () {
            showDialog(
              context: context,
              builder: (context) => ExitDialog(
                onLeave: _handleLeave,
                onCancel: _handleCancel,
              ),
            );
          },
        ),
        backgroundColor: Color.fromRGBO(236, 235, 245, 1),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: gameOver
                  ? ResultWidget(
                      correctAnswers: correctAnswers,
                      totalQuestions: totalQuestions,
                      onPlayAgain: resetGame,
                      onExit: exitGame,
                    )
                  : QuestionWidget(
                      currentQuestion: bookQuestions[currentQuestionIndex],
                      options: options,
                      isAnswered: isAnswered,
                      isCorrect: isCorrect,
                      selectedAnswer: selectedAnswer,
                      onSelectAnswer: selectAnswer,
                      onNextQuestion: nextQuestion,
                      currentQuestionIndex: currentQuestionIndex,
                      totalQuestions: totalQuestions,
                    ),
            ),
            StarsOverlay(
              isGameOver: gameOver,
              isAnswered: isAnswered,
              isCorrect: isCorrect,
            ),
          ],
        ),
      ),
    );
  }
}
