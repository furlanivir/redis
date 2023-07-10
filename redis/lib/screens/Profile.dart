import 'package:flutter/material.dart';
import 'Settings.dart';
import 'LoginPage.dart';

class ProfileScreen extends StatefulWidget{
  String? name;
  String? surname;
  //mail
  String? birthday;
  ProfileScreen({this.name,this.surname,this.birthday});

  @override
  State<StatefulWidget> createState(){
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen>{
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();

    // Set initial values 
    nameController.text=widget.name ?? '';
    surnameController.text = widget.surname ?? '';
    birthdayController.text = widget.birthday ?? '';
  }

  // Widget to create each entry of the form
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
          borderRadius: BorderRadius.circular(15.0),
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
          borderRadius: BorderRadius.circular(15.0),
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
  /*
  Widget _buildMail(){
    return TextFormField(
      controller: mailController,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Email Address',
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.white),
        ),),
      validator: (value) { 
        if(value!.isEmpty){
          return 'Email is Required';
        }
        return null;
      },
    );
  } //buildMail
*/ 

  Widget _buildBirthday(){
    return TextFormField(
      controller: birthdayController,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Birthday',
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.white),
        ),),
      validator: (value) { 
        if(value!.isEmpty){
          return 'Birthday is Required';
        }
        return null;
      },
    );
  } //buildBirthday

  @override
  Widget build(BuildContext context){
    String name=nameController.text;
    String surname=surnameController.text;
    // MAIL 
    String birthday=birthdayController.text;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(88, 86, 184, 1),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios,size: 25,color: Colors.white)),
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
        decoration:  const BoxDecoration(
          gradient: LinearGradient(begin: AlignmentDirectional.topEnd,colors: [Color.fromRGBO(88, 86, 184, 1),Color.fromRGBO(38, 7, 75, 1)])
        ),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: 
        Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[ //the form is build using the widget previously created 
              _buildName(),
              _buildSurname(),
              //_buildMail(),
              _buildBirthday(),
              ElevatedButton(onPressed: ()=>{ //when the button is pressed, if the forme is valid, the data written by the users are saved
                name = nameController.text,
                surname = surnameController.text,
                birthday = birthdayController.text,
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save(),
                  Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context)=>SettingsScreen(
                      name: name,
                      surname: surname,
                      birthday: birthday
                    ))
                  )
                },
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(88, 86, 184, 1)
                ), 
                child: const Text('Save', style: TextStyle(fontSize: 20),), 
                ),
              ],
            ),
          ),
        )
        )
      );
  }
}