
import 'package:flutter/material.dart';



class SplashScreen extends StatelessWidget{
  const SplashScreen( {super.key,required this.startQuiz});
  final void Function()  startQuiz ;

  @override
  Widget build(BuildContext context) {
   return  Center(
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [

               Image.asset(
                 'assets/images/quiz-logo.png',
                 width: 200,
                 color: const Color.fromARGB(120, 255, 255, 255),

               )

               /* Opacity(
                  opacity: 0.4,
                child: Image.asset(
                  'assets/images/quiz-logo.png',
                  width: 200,

                ),)*/,
               const SizedBox(
                 height: 30,
               ),
               const Text(
                 'Learn Flutter the fun way!',
                 style: TextStyle(
                     fontSize: 26, color: Color.fromARGB(255, 177, 155, 229)),
               ),
               const SizedBox(
                 height: 30,
               ),
               OutlinedButton.icon(
                   onPressed: (){
                     startQuiz()  ;
                   },
                   icon: const Icon(Icons.arrow_right_alt),
                   style: OutlinedButton.styleFrom(
                     backgroundColor: Colors.blueAccent,
                   ),
                   label: const Text("Start Quiz"))
             ],
           ),
         ) ;
  }

}