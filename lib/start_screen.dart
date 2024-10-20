import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.quizScreen, {super.key});
  final void Function() quizScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: 
      Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/quiz-logo.png',
            width: 300,
            color: Color.fromARGB(255, 228, 227, 227),
            ),
            SizedBox(height: 20),
            Text('Learn Flutter the Fun way!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 22
            )),
            SizedBox(height: 20),
            OutlinedButton.icon( onPressed: () {
              quizScreen();
            },
            icon: Icon(Icons.arrow_right_alt_sharp,
            color: Colors.white,),
            label: Text('Start Quiz',
            style: TextStyle(color: Colors.white,
            fontSize: 16),
            )),
            SizedBox(height: 20)
          ]
    )
    );
  }
}