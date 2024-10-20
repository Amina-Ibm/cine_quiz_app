import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cine_quiz_app/data/questions.dart';
import 'package:cine_quiz_app/question_summary.dart';
import 'package:cine_quiz_app/quiz.dart';

class resultScreen extends StatelessWidget{

  resultScreen({super.key, required this.choosenAnswers, required this.setscreen()});
  final List<String> choosenAnswers;
  final void Function() setscreen;

  List<Map<String, Object>> getSummary(){
    List<Map<String, Object>> summary = [];


    for (var i = 0; i < questions.length ; i++ ){
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'choosen_answer': choosenAnswers[i]
      }
      );
    }
    return summary;
  }

  Widget build(context){
    final totalQuestions = questions.length;
    final summary = getSummary();
    final correctAnswers = summary.where((data) {
      return data['correct_answer'] == data['choosen_answer'];
    }).length;

    return Container(
      margin: EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text('You answered ${correctAnswers} out of ${totalQuestions} questions correctly!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 16
            ),),
            SizedBox(height: 50,),
            questionSummary(getSummary()),
            SizedBox(height: 20,),

            TextButton(onPressed: setscreen, child: Text('Reset quiz',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 14,

                ),
              ),)

          ],
        ),
      )
    );
  }
}