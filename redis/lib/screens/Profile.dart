import 'package:flutter/material.dart';
import 'package:redis/screens/Settings.dart';
import 'Settings.dart';
import 'LoginPage.dart';
import 'ProfileResult.dart';
import 'ProfileModel.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState(){
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Model model=Model(name: '', surname: '', mail: '', birth: '');

  Widget _buildName(){
    return TextFormField(
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
      onSaved: (value){
        model.name=value!;
      }
    );
  } //buildName

  Widget _buildSurname(){
    return TextFormField(
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
      onSaved: (value){
        model.surname=value!;
      }
    );
  } //buildSurname

  Widget _buildMail(){
    return TextFormField(
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Email address',
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
          return 'Email is Required';
        }
        return null;
      },
      onSaved: (value){
        model.mail=value!;
        }
    );
  } //buildName

    Widget _buildBday(){
    return TextFormField(
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Birthday',
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
          return 'Birthday is Required';
        }
        return null;
      },
      onSaved: (value){
        model.birth=value!;
        }
    );
  } //bui
  
  @override
  
  Widget build(BuildContext context){
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
                _buildMail(),
                _buildBday(),
                ElevatedButton(onPressed: ()=>{
                  // 
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save(),
                    Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context)=>Result(model: this.model))
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