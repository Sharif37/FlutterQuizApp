import 'package:flutter/material.dart';
import 'package:quizapp/SplashScreen.dart';
import 'package:quizapp/resultscreen.dart';

import 'QuestionScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

var startPosition = Alignment.topLeft;
var endPosition = Alignment.bottomRight;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  late Widget activeScreen;
  @override
  void initState() {
    super.initState();
    activeScreen = SplashScreen(startQuiz: startQuiz);
  }

  void startQuiz() {
    setState(() {
      activeScreen = QuestionScreen(
        onQuizFinished: onQuizFinished,
      );
    });
  }

  void onQuizFinished(List<String> answers) {
    setState(() {
      activeScreen = ResultScreen(
        answers,
        reStartQuiz: restartQuiz,
      );
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = SplashScreen(
        startQuiz: startQuiz,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Color.fromARGB(255, 125, 25, 255),
                Colors.indigoAccent
              ],
              begin: startPosition,
              end: endPosition,
            ),
          ),
          child: activeScreen),
    );
  }
}
