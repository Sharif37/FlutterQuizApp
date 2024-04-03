import 'package:flutter/material.dart';

class AnswerOptions extends StatelessWidget{
  const AnswerOptions({required this.options,required this.onTap,super.key});
  final String options ;
  final void Function() onTap ;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 99, 41, 229),
          foregroundColor: Colors.white,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),
          )
        ),
        child: Text(options,
          textAlign: TextAlign.center,
        )
    ) ;
  }


}