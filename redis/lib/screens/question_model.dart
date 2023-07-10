class Question {
  final String questionText;
  final List<Answer> answerList;
  
  Question(this.questionText, this.answerList);
}

class Answer {
  final int answerText;
  Answer(this.answerText);
}

List<Question> getQuestions(){
  List<Question> list = [];

  list.add(
    Question(
      "How many cigarettes have you smoked?",
      [
        Answer(0),
        Answer(1),
        Answer(2),
        Answer(3),
        Answer(4),
        Answer(5),
      ]
  ));
  
  list.add(
    Question(
      "How many drinks did you have?",
      [
        Answer(0),
        Answer(1),
        Answer(2),
        Answer(3),
        Answer(4),
        Answer(5),
      ]
  ));
  
  list.add(
    Question(
      "Do you feel altered?",
      [
        Answer(0),
        Answer(1),
        Answer(2),
        Answer(3),
        Answer(4),
        Answer(5),
      ]
  ));
  
  list.add(
    Question(
      "Are you struggling to read?",
      [
        Answer(0),
        Answer(1),
        Answer(2),
        Answer(3),
        Answer(4),
        Answer(5),
      ]
  ));
  
  list.add(
    Question(
      "Did you struggle to get home?",
      [
        Answer(0),
        Answer(1),
        Answer(2),
        Answer(3),
        Answer(4),
        Answer(5),
      ]
  ));

  return list;
}