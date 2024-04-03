import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/AnswerOption.dart';
import 'package:quizapp/QuestionDemoData.dart';


class QuestionScreen extends StatefulWidget {
  final Function(List<String>) onQuizFinished;
  const QuestionScreen({super.key,required this.onQuizFinished});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }


}

class _QuestionScreen extends State<QuestionScreen> {
   List<String>ans=[] ;
  var   index=0 ;
   void AnswerQuestion(String selectedOptions) {
     setState(() {
       ans.add(selectedOptions);
       if (index < questions.length - 1) {
         index++;
       } else {
         /*Navigator.pushReplacement(
           context,
           MaterialPageRoute(builder: (context) {
            return const resultscreen() ;

           }),
         );*/
         widget.onQuizFinished(ans);
       }
     });
   }


   void choiceAns(String answer){
    ans.add(answer) ;
  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[index];
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize:23 ,
                  fontWeight:FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledOptions().map((option) {
              return  AnswerOptions(
                options: option,
                onTap:(){
                  AnswerQuestion(option) ;
                },
              );
            })

          ],
        ),
      ),
    );
  }
}
