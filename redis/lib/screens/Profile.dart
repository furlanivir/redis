import 'package:flutter/material.dart';
import 'package:redis/provider.dart';
import 'Settings.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget{
  String? name;
  String? surname;
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
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  @override
  
  void initState(){
    super.initState();
    // Set initial values 
    SharedPreferences.getInstance().then((sp) {
    setState(() {
      nameController.text = sp.getString('name') ?? '';
      surnameController.text = sp.getString('surname') ?? '';
      birthdayController.text = sp.getString('birthday') ?? '';
    });
  });
  }


  // Widget to create each entry of the form
  Widget _buildName(){
    return TextFormField(
      controller: nameController,
      cursorColor: Color.fromRGBO(215, 223, 255, 1),
      style: const TextStyle(color: Color.fromRGBO(215, 223, 255, 1)),
      decoration: InputDecoration(
        labelText: 'Name',
        labelStyle: const TextStyle(color: Color.fromRGBO(215, 223, 255, 1)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(215, 223, 255, 1))
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Color.fromRGBO(215, 223, 255, 1)),
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
      cursorColor: Color.fromRGBO(215, 223, 255, 1),
      style: const TextStyle(color: Color.fromRGBO(215, 223, 255, 1)),
      decoration: InputDecoration(
        labelText: 'Surname',
        labelStyle: const TextStyle(color: Color.fromRGBO(215, 223, 255, 1)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(215, 223, 255, 1))
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Color.fromRGBO(215, 223, 255, 1)),
        ),),
      validator: (value) { 
        if(value!.isEmpty){
          return 'Surname is Required';
        }
        return null;
      },
    );
  } //buildSurname
  
  Widget _buildMail(email) {
  return Consumer<Exchange>(
    builder: (context, exchange, _) {
      String currentEmail = email ?? exchange.email;

      return TextFormField(
        initialValue: currentEmail,
        cursorColor: Color.fromRGBO(215, 223, 255, 1),
        style: const TextStyle(color: Color.fromRGBO(215, 223, 255, 1)),
        decoration: InputDecoration(
          labelText: 'Email Address',
          labelStyle: const TextStyle(color: Color.fromRGBO(215, 223, 255, 1)),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(215, 223, 255, 1))
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Color.fromRGBO(215, 223, 255, 1)),
          ),
        ),
        onChanged: (value) {
          exchange.sendUser(value);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Email is Required';
          }
          return null;
        },
      );
    },
  );
}//buildMail


  Widget _buildBirthday(){
    return TextFormField(
      controller: birthdayController,
      cursorColor: Color.fromRGBO(215, 223, 255, 1),
      style: const TextStyle(color: Color.fromRGBO(215, 223, 255, 1)),
      decoration: InputDecoration(
        labelText: 'Birthday',
        labelStyle: const TextStyle(color: Color.fromRGBO(215, 223, 255, 1)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(215, 223, 255, 1))
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Color.fromRGBO(215, 223, 255, 1)),
        ),),
      validator: (value) { 
        if(value!.isEmpty){
          return 'Birthday is Required';
        }
        return null;
      },
    );
  } //buildBirthday

  Widget _buildPsw(psw){
    return TextFormField(
      initialValue: psw,
      obscureText: true,
      cursorColor: Color.fromRGBO(215, 223, 255, 1),
      style: const TextStyle(color: Color.fromRGBO(215, 223, 255, 1)),
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: const TextStyle(color: Color.fromRGBO(215, 223, 255, 1)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(215, 223, 255, 1))
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Color.fromRGBO(215, 223, 255, 1)),
        ),),
      validator: (value) { 
        if(value!.isEmpty){
          return 'Password is Required';
        }
        else{
          Provider.of<Exchange>(context,listen: false).sendPsw(value);
        }
        return null;
      },
    );
  } //buildMail

  @override
  Widget build(BuildContext context){
    String name=nameController.text;
    String surname=surnameController.text;
    String birthday=birthdayController.text;
    String email = Provider.of<Exchange>(context, listen: false).email;
    String password = Provider.of<Exchange>(context, listen: false).password;

    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(32, 12, 75, 1),
        leading: IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen())),
          icon: const Icon(Icons.arrow_back_ios,size: 25,color: Color.fromRGBO(215, 223, 255, 1))),
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
          gradient:LinearGradient(begin: AlignmentDirectional.topEnd,colors: [Color.fromRGBO(32, 12, 75, 1),Color.fromRGBO(86, 54, 157, 1)])
        ),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 10), 
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [ //the form is build using the widget previously created 
              _buildName(),
              _buildSurname(),
              _buildMail(email),
              _buildBirthday(),
              _buildPsw(password),
              ElevatedButton(onPressed: ()async{ //when the button is pressed, if the forme is valid, the data written by the users are saved
                name = nameController.text;
                surname = surnameController.text;
                birthday = birthdayController.text;
                SharedPreferences sp = await SharedPreferences.getInstance();
                await sp.setString('email', (Provider.of<Exchange>(context, listen: false).email));
                print('new email from profile: ${sp.getString('email')}');
                await sp.setString('name', name);
                await sp.setString('surname', surname);
                await sp.setString('birthday', birthday);
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context)=>SettingsScreen(
                      name: name,
                      surname: surname,
                      birthday: birthday
                    ))
                  );
                };
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(32, 12, 75, 1)
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