import 'package:flutter/material.dart';
import 'package:redis/screens/Settings.dart';
import 'Settings.dart';
import 'LoginPage.dart';

class ProfileScreen extends StatefulWidget{
  String? name;
  String? surname;
  ProfileScreen({this.name,this.surname});
  //const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState(){
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen>{
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();

    // settare valori iniziali se forniti ???
    nameController.text=widget.name ?? '';
    surnameController.text = widget.surname ?? '';
  }
  
  Widget _buildName(){
    return TextFormField(
      controller: nameController,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Name',
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.white),
        ),),
      validator: (value) { 
        if(value!.isEmpty){
          return 'Name is Required';
        }
        return null;
      },
    );
  } //buildName

  Widget _buildSurname(){
    return TextFormField(
      controller: surnameController,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Surname',
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.white),
        ),),
      validator: (value) { 
        if(value!.isEmpty){
          return 'Surname is Required';
        }
        return null;
      },
    );
  } //buildSurname

  @override
  Widget build(BuildContext context){
    String name=nameController.text;
    String surname=surnameController.text;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(88, 86, 184, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',
            fit: BoxFit.cover,
            height: 60,
            )
          ],
        ),
      ),
      
      body: Container(
        decoration:  const BoxDecoration(
          //color: Color.fromRGBO(97, 36, 141, 1),
          gradient: LinearGradient(begin: AlignmentDirectional.topEnd,colors: [Color.fromRGBO(88, 86, 184, 1),Color.fromRGBO(38, 7, 75, 1)])
        ),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildName(),
                _buildSurname(),
                //_buildMail(),
                //_buildBday(),
                ElevatedButton(onPressed: ()=>{ 
                  name = nameController.text,
                  surname = surnameController.text,
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save(),
                    Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context)=>SettingsScreen(
                        name: name,
                        surname: surname,
                      ))
                  )
                  },
                }, child: const Text('Submit'), 
                ),
              ],
            ),
          ),
        )
      );
  }
}