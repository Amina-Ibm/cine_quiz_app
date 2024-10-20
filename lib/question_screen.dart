import 'package:flutter/material.dart';
import 'package:cine_quiz_app/model/answerbutton_model.dart';
import 'package:cine_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget{
  const QuestionScreen({super.key, required this.addAnswer});
  final void Function(String answer) addAnswer;
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}
class _QuestionScreenState extends State<QuestionScreen>{
  var questionIndex = 0;
  void nextQuestion(String answer){
    widget.addAnswer(answer);
    setState(() {
  questionIndex++;
    });

}
  
  @override
  Widget build(BuildContext context){
    final currentQuestion = questions[questionIndex];
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
        Text(currentQuestion.question,

        style: GoogleFonts.lato(color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold

        ) ),
        SizedBox(height: 30,),
        ...currentQuestion.getShuffledList().map((answer) {
        return AnswerButton(answer: answer, onTap: (){
          nextQuestion(answer);
        });
      }
        )
        ]),
      )
    ) 
       
        
      
    ;
  }
}