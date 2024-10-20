import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  AnswerButton({required this.answer, required this.onTap, super.key});
  final String answer;
  final void Function() onTap;
  @override
  Widget build(context){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                ),

              ),
              child: Text(answer),
            ),
            SizedBox(height: 10,)

          ],)
    );
     
  }
}