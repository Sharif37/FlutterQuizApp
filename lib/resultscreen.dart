import 'package:flutter/material.dart';
import 'package:quizapp/AnsSummary.dart';

import 'QuestionDemoData.dart';

class ResultScreen extends StatelessWidget {
  final List<String> ans;
  final VoidCallback reStartQuiz;

  const ResultScreen(this.ans, {super.key, required this.reStartQuiz});

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < ans.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].options[0],
        'user_answer': ans[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var correctAns = getSummary().where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "You Answered ${ans.length} out of $correctAns questions.",
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 30),
            const Text(
              "List of answers:",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            AnsSummary(getSummary()),
            const SizedBox(height: 30),
            TextButton(
              onPressed: reStartQuiz,
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromARGB(255, 123, 234, 234),
                ),
              ),
              child: const Text(
                "Restart Quiz",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
