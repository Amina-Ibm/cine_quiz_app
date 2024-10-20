import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class questionSummary extends StatelessWidget{
  questionSummary(this.summaryData ,{super.key});
  List<Map<String, Object>> summaryData;

  Widget build(context){
    return SizedBox(
      height: 300,
      width: 700,
      child: SingleChildScrollView(
        child: Column(
          children:
          summaryData.map((data) {
            return Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue[200],
                  child: Center(
                    child: Text(((data['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 14,

                      ),
                    ),

                  ),
                ),

                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'] as String,
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 14,
                            fontWeight: FontWeight.bold
                          )),
                      SizedBox(height: 5,),
                      Text(data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                              color: Colors.grey[400],
                              fontSize: 14
                          )),
                      SizedBox(height: 5,),
                      Text(data['choosen_answer'] as String,
                          style: GoogleFonts.lato(
                              color: Colors.blue[200],
                              fontSize: 14
                          )
                          ),
                    ],
                  ),
                )

              ],
            );
          }).toList(),
        ),
      )
    );
  }
}