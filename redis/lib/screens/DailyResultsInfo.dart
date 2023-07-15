import 'package:flutter/material.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';

//A page with more information about the sleep session, with a check on the sleep stages range 
class ResultsInfo extends StatefulWidget {
  final dur;
  final deep;
  final rem;
  final wake;
  final score;
  final quiz;

  const ResultsInfo(this.dur,this.deep,this.rem,this.wake,this.score,this.quiz);
  @override
  State<ResultsInfo> createState() => _ResultsInfoState();
}

class _ResultsInfoState extends State<ResultsInfo> {

  @override
  Widget build(BuildContext context) {
    
    double refDeepMin = widget.dur*10/100;
    double refRemMin = widget.dur*19/100;
    double refRemMax = widget.dur*23/100;
    double refWakeMax = widget.dur*9/100;
    return Scaffold(
        appBar: AppBar(
        backgroundColor: const Color.fromRGBO(16, 2, 63, 1),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios,size: 25,color: Color.fromRGBO(215, 223, 255, 1))),
          title: const Text('Did you sleep well?', style: 
          TextStyle(fontWeight: FontWeight.bold,letterSpacing: 2,fontSize: 25,color:Color.fromRGBO(215, 223, 255, 1))
          )
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

            child: ListView(children: [
              const SizedBox(height: 30),
              const Text('More information about your sleep session:',
              style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 20,fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
                decoration: BoxDecoration(border:Border.all(color: const Color.fromRGBO(215, 223, 255, 1),width: 2),
                borderRadius: BorderRadius.circular(10), color: const Color.fromRGBO(16, 2, 63, 1),
                ),
                child: Column(
                  children: [
                  const SizedBox(height: 10),
                  Text('You slept a total of: ${Duration(hours:widget.dur.toInt()).inHours.toString().padLeft(2,'0')}:'
                      '${((Duration(minutes:((widget.dur*60).toInt()))).inMinutes%60).toString().padLeft(2,'0')} h',
                      style: const TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 22,fontWeight: FontWeight.w600),),
                  const SizedBox(height: 5),
                  const Text('Sleep Stages: ',style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 22,fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  Text('Deep: ${widget.deep} h',style: const TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 22,fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  Text('Rem: ${widget.rem} h',style: const TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 22,fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  Text('Wake: ${widget.wake} h',style: const TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 22,fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  Text('Your overall sleep score was: ${widget.score}%',style: const TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 21,fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                ],
              )),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
                decoration: BoxDecoration(border:Border.all(color: const Color.fromRGBO(215, 223, 255, 1),width: 2),
                borderRadius: BorderRadius.circular(10), color: Colors.transparent,
                ),
                child: Column(children: [
                  const SizedBox(height: 10),
                  Container( child: widget.dur==0 ? (Text('There is no sleep data for today! Please come back tomorrow when you have uploaded the data ',style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 22),)) :
                    //DEEP fuori soglia
                    (widget.deep<refDeepMin)?(const Text("According to standard reference intervals, deep sleep should be between 10-12%, and is an important phase of physical recovery. Yours is too low. To increase the deep sleep phase, it is essential to reduce alcohol abuse and smoking.",
                      style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 22),)) :
                        (const Text('Your deep sleep phase is at least 10%, you should feel rested, this phase is crucial for physical recovery!',
                        style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 22),)
                        )
                  ),
                  const SizedBox(height: 10),
                  Container( child: widget.dur==0 ? (Text('')) :
                    // REM fuori soglia
                    (widget.rem<refRemMin || widget.rem>refRemMax)?(const Text("Your REM sleep is not within the 19-27% standard. Did you know that alcohol can suppress it almost completely? Try stopping drinking to improve your REM sleep; this is critical for mental and emotional health",
                      style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 22),)):
                    (const Text('Your REM sleep averages 19-27%. Good job, this phase is essential for mental and emotional health',
                      style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 22),))
                  ),
                  const SizedBox(height: 10),
                  Container( child: widget.dur==0 ? (Text('')) :
                    // wake fuori soglia 
                    (widget.wake>refWakeMax)?(const Text("You have been awake for more than 9% on average. This means that you fell asleep with difficulty or woke up often during sleep. It could be due to smoking abuse, since nicotine has an excitatory effect",
                      style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 22),)):
                    (const Text('Your waking phase is within the average range of 0-9%. It means that you fell asleep with ease,and your sleep was uneventful! Definitely one of the benefits of reducing alcohol and smoking.',
                      style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1),fontSize: 22),))
                  ),
                  const SizedBox(height: 10),
                ])
              )
            ],)
          ),
          /*
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: const Color.fromRGBO(106, 128, 237, 1),
            color: const Color.fromRGBO(86, 86, 213, 1),
            animationDuration: const Duration(milliseconds: 300),
            onTap: (index) => {}/*
              if (index==0){Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => const WeekResults()))),},
              if(index==1){Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => HomePage()))),},
              if(index==2){Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => Results()))),}
            } */,
            
            items: const [
            Icon(
              Icons.timeline,
              color: Colors.white,
              ),
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.check_box,
              color: Colors.white,
            ),
      ])*/
    );
  }
}