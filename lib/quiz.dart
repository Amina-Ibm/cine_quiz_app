import 'package:flutter/material.dart';
import 'package:cine_quiz_app/data/questions.dart';
import 'package:cine_quiz_app/question_screen.dart';
import 'package:cine_quiz_app/result_screen.dart';
import 'start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz>{
  List<String> choosenAnswers = [];
  var activeScreen = 'start-screen';
  void addAnswer(String answer){
    choosenAnswers.add(answer);

    if (choosenAnswers.length == questions.length){
      setState(() {
        activeScreen = 'result-screen';
      });
      
    }
  }

  void setscreen(){
    setState(() {
      activeScreen = 'question-screen';
      choosenAnswers = [];
    });
    
  }


  @override
  Widget build(BuildContext context){
    Widget setActiveScreen(){
      if (activeScreen == 'start-screen') {
        return StartScreen(setscreen);
      }
      else if (activeScreen == 'result-screen') {
        return resultScreen(choosenAnswers: choosenAnswers, setscreen: setscreen,);
      }
      else {
      return QuestionScreen(
      addAnswer: addAnswer,
      );
      }


      }

    return MaterialApp(
      home: Scaffold (
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.purple, Colors.blue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight)
        ),
        child: setActiveScreen()

    )
      )
    )
    ;
  }
}