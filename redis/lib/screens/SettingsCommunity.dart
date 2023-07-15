import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


// A screen with some informations about alcholism and quit smoking

class CommunityScreen extends StatelessWidget{

_launchURL_AA() async {
  Uri _url = Uri.parse('https://www.aa.org/find-aa');
  if (await launchUrl(_url)) {
    await launchUrl(_url);
  } else {
    throw 'Could not launch $_url';
  }
}
_launchURL_help() async {
  Uri _url = Uri.parse('https://smokefree.gov/');
  if (await launchUrl(_url)) {
    await launchUrl(_url);
  } else {
    throw 'Could not launch $_url';
  }
}
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
            Image.asset('assets/images/pittogramma.png',
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
        child: SafeArea(
          child: Padding(padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40), child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('ReDIS Community',style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1,),fontSize: 30,fontWeight: FontWeight.bold),),
              const SizedBox(height: 50,),
              const Text("ReDIS is an app designed to help you monitor your sleep and the benefits of it when you don't give in to your addictions. If the stimulus to improve your rest is not enough, we suggest you turn to more concrete help:",
              style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1,),fontSize: 20), textAlign: TextAlign.justify,),
              const SizedBox(height: 50,),
              InkWell(onTap: _launchURL_AA,
              child: 
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: const Color.fromRGBO(32, 12, 75, 1)),
                child: const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                child: Text('Find AA meeting',style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1,),fontSize: 20),))
              )
              ),
              const SizedBox(height: 50,),
              InkWell(onTap: _launchURL_help,
              child: 
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: const Color.fromRGBO(32, 12, 75, 1)),
                child: const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                child: Text('I want to quit smoking',style: TextStyle(color: Color.fromRGBO(215, 223, 255, 1,),fontSize: 20),))
              )
              ) 
            ],
          )
          )
        )
      )
    );
  }

}

