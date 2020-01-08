import 'package:flutter/material.dart';

import '../mixins/validation_mixin.dart';

class LogInScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LogInScreenState();
  }
}

class LogInScreenState extends State<LogInScreen> with ValidationMixin{
  final formKey=GlobalKey<FormState>();

  String myEmail='Random';
  String myPass='';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            createEmailWidget(),
            createPasswordWidget(),
            generateSpace(25),
            createButton('Submit'),
          ],
        ),
      ),
    );
  }

  Widget generateSpace(double s){
    return Container(
      margin: EdgeInsets.only(bottom: s),
    );
  }

  Widget createButton(String str){
    return RaisedButton(
      child: Text(str),
      onPressed: (){
        if(formKey.currentState.validate()){
          print('Email Before $myEmail');
          print('Password Before $myPass');
          formKey.currentState.save();
          print('Email After $myEmail');
          print('Password After $myPass');
        }
      },
      textColor: Color.fromRGBO(255, 0, 0, 1),
      color: Colors.cyan,
    );
  }

  Widget createEmailWidget(){
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter a valid email',
      ),
      validator: emailValidator,
      onSaved: (String str){
        myEmail=str;
      },
    );
  }

  Widget createPasswordWidget(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter a valid password',
      ),
      validator: passwordValidator,
      onSaved: (String str){
        myPass=str;
      },
    );
  }
}