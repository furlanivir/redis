import 'package:flutter/material.dart';
import 'package:redis/screens/HomePage.dart';
import 'package:redis/provider.dart';
import 'package:redis/screens/question_model.dart';
import 'package:provider/provider.dart';

import '../repository/DataBaseRepository.dart';

class Questionnaire extends StatefulWidget {
  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score0 = 0;
  int score1 = 0;
  int score2 = 0;
  int score3 = 0;
  int score4 = 0;
  int score5 = 0;
  double mean_score = 0;
  Answer? selectedAnswer;
  bool isLocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Color.fromRGBO(32, 12, 75, 1),
          actions: [IconButton(onPressed: () => {showDialog(context: context, builder: (_) => _showInstructionDialog(),)}, icon: const Icon(Icons.question_mark, color: Color.fromRGBO(215, 223, 255, 1)))],

          title: const Text('Questionnaire',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromRGBO(215, 223, 255, 1),),),
        ),
        body: 
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration:  const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sfondo.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.9,
                )),

            child: Column(children: [
              _questionWidget(),
              _answerList(),
              _nextButton(),
            ],)
            ),);
  }

  _questionWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
          child: Text(
          "Question ${currentQuestionIndex+1}/${questionList.length.toString()}",
          style: const TextStyle(
            color: Color.fromRGBO(215, 223, 255, 1),
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        )),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Color.fromRGBO(97, 36, 141, 1),
            borderRadius: BorderRadius.circular(16),
          ),
          
          child:Padding( padding: const EdgeInsets.symmetric(),
            child: Column(
              children: [
                Center(child: Text(
                  textAlign: TextAlign.center,
                  questionList[currentQuestionIndex].questionText,
                  style: const TextStyle(
                    color: Color.fromRGBO(215, 223, 255, 1),
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
            )))]),
          ),
        )
      ],
    );
  }

  _answerList(){
    return Column(
      children: questionList[currentQuestionIndex].answerList.map(
        (e) => _answerButton(e),
        )
        
      .toList(),
    );
  }
  
  Widget _answerButton(Answer answer){
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 60,
      child: ElevatedButton(
        child: Text(
              answer.answerText.toString(), 
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w600)
              ),  
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected ? Color.fromRGBO(32, 12, 75, 1) : Color.fromRGBO(215, 223, 255, 1),
          onPrimary: isSelected ? Color.fromRGBO(215, 223, 255, 1) : Color.fromRGBO(32, 12, 75, 1),
        ),
        onPressed: (){

          if(selectedAnswer == null){
            if(answer.answerText == 0){
              score0++;
              isLocked = true;
            }
            if(answer.answerText == 1){
              score1++;
              isLocked = true;
            }
            if(answer.answerText == 2){
              score2++;
              isLocked = true;
            }
            if(answer.answerText == 3){
              score3++;
              isLocked = true;
            }
            if(answer.answerText == 4){
              score4++;
              isLocked = true;
            }
            if(answer.answerText == 5){
              score5++;
              isLocked = true;
            }
            setState(() {
            selectedAnswer = answer;
            });
          };
        },
      )
    );  
  }

  _nextButton(){
    
    bool isLastQuestion = false;
    if(currentQuestionIndex==questionList.length-1){
      isLastQuestion=true;
    }

    return Container(
      width: MediaQuery.of(context).size.width*0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(
          isLastQuestion? "Submit":"Next", 
          style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600)),  
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: const Color.fromARGB(255, 93, 129, 245),
          onPrimary: Color.fromRGBO(215, 223, 255, 1),
        ),
        onPressed: (){
          if(isLocked){
          if(isLastQuestion){
            showDialog(context: context, builder: (_) => _showScoreDialog());
          } 
          else {
            setState((){
              selectedAnswer = null;
              isLocked = false;
              currentQuestionIndex++;
            }
            );
          }
          }
         
        },
      )
    );  
  }
  
  _showScoreDialog(){
    final mean_score = (score1*1 + score2*2 + score3*3 + score4*4 + score5*5)/questionList.length;
    return AlertDialog(
      title: Text("Nothing: $score0 times; \nVery few: $score1 times; \nFew: $score2 times; \nQuite: $score3 times; \nA lot: $score4 times; \nToo much: $score5 times; \n", 
          style: TextStyle(
              color: Color.fromRGBO(32, 12, 75, 1),
              fontSize: 25,
              fontWeight: FontWeight.w600,
      )),
      content: ElevatedButton(
        child: const Text("Save"), 
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 93, 129, 245),
          onPrimary: Color.fromRGBO(215, 223, 255, 1),
        ),
        onPressed: (){
          String day = Provider.of<Exchange>(context, listen: false).today;
          Provider.of<Exchange>(context, listen:false).getMeanScore(mean_score);
          Provider.of<DataBaseRepository>(context, listen: false).updateQuizScoreByDate(mean_score, day);
          setState(() {
            currentQuestionIndex = 0;
            score0=0;
            score1=0;
            score2=0;
            score3=0;
            score4=0;
            score5=0;
            selectedAnswer = null;
          });
          Navigator.pop(context);
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          
      },),
    );
  }

  _showInstructionDialog(){
    return AlertDialog(
      title: Text("Legend: \n 0 = Nothing; \n 1 = Very few; \n 2 = Few; \n 3 = Quite; \n 4 = A lot; \n 5 = Too much", 
          style: TextStyle(
              color: Color.fromRGBO(32, 12, 75, 1),
              fontSize: 40,
              fontWeight: FontWeight.w600,
      )),
    );
  }

}

