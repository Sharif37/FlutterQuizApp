import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnsSummary extends StatelessWidget {
  final List<Map<String, Object>> summary;

  const AnsSummary(this.summary, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summary.map((data) {
            Color backgroundColor = (data['user_answer'] == data['correct_answer'])
                ? Colors.green
                : Colors.red;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor,
              ),
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        (data['user_answer']) as String,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 202, 171, 252),
                        ),
                      ),
                      Text(
                        (data['correct_answer']) as String,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 81, 222, 71),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
