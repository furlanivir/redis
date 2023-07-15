import 'package:flutter/material.dart';


// Screen with some Q&A about sleep and addictions 

class FAQScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(32, 12, 75, 1),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios,size: 25,color: Color.fromRGBO(215, 223, 255, 1,))),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 100),
            Image.asset('assets/images/logo.png',
            fit: BoxFit.cover,
            height: 60,
            )
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height:  MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient:LinearGradient(begin: AlignmentDirectional.topEnd,colors: [Color.fromRGBO(32, 12, 75, 1),Color.fromRGBO(86, 54, 157, 1)])
        ),
        child: const SafeArea(
          child: Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20), child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('FAQs',style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1,),fontSize: 35,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Row(
                children:[
                  Icon(Icons.question_answer_rounded,color: Color.fromRGBO(215, 223, 255, 1,),size: 35,),
                  SizedBox(width: 20,),
                  Flexible(child: 
                  Text('Why is it important to monitor sleep?',
                  style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1,),fontStyle: FontStyle.italic,fontWeight: FontWeight.bold, fontSize: 25))
                  )
                ]
              ),
              SizedBox(height: 10),
              Flexible(child:
              Text('Sleep is essential for the functioning and maintenance of our bodies. It consists of several stages, traversed several times during the night. For example, the deep sleep phase is the one needed to feel rested once you wake up ',
              style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1,),fontSize: 20)),
              ),
              SizedBox(height: 20),
              Row(
                children:[  
                  Icon(Icons.question_answer_rounded,color: Color.fromRGBO(215, 223, 255, 1,),size: 35,),
                  SizedBox(width: 20),
                  Flexible(child:
                  Text('How do my addictions affect my sleep?',
                  style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1,),fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 25))
                  )
                ]
              ),
              SizedBox(height: 10),
              Flexible(child: 
              Text('Did you know that for every cigarette you lose up to 1.2 minutes of sleep per night? Like smoking, alcohol also decreases the hours you sleep and makes your sleep fragmented and restless',
              style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1,), fontSize: 20)),
              ),
              SizedBox(height: 20),
              Row(
                children:[
                  Icon(Icons.question_answer_rounded,color: Color.fromRGBO(215, 223, 255, 1,),size: 35,),
                  SizedBox(width: 20),
                  Text('What advantages can I get?',
                  style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1,),fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 25))
                ]
              ),
              SizedBox(height: 10),
              Flexible(child: 
              Text('By decreasing smoking and alcohol, your sleep will improve. You will in fact reach more intense deep sleep stages, and the time it takes you to fall asleep will also decrease ',
              style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1,),fontSize: 20)), 
              ),
            ],
          )
          )
        )
      )
    );
  }
}