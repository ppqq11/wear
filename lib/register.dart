import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatelessWidget {
  // Explicit
  final formKey = GlobalKey<FormState>();
  late String nameString, emailString, passwordString;

  //Method

  Widget registerButton() {
    return IconButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            print(
                'name = $nameString , email = $emailString , password = $passwordString');
            registerThread();
          }
        },
        icon: Icon(Icons.cloud_upload));
  }

  Future<void> registerThread() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Register Success for Email = $emailString');
    }).catchError((response) {
      String title = response.hashCode as String;
      String message = response.message;
      print('titel =$title,message = $message');
    });
  }

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.face,
            color: Colors.black,
            size: 32.0,
          ),
          labelText: 'Display Name :',
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          helperText: 'Type your Nick Name for Displat',
          helperStyle: TextStyle(fontStyle: FontStyle.italic)),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Fill Your Name in the BLank';
        } else {
          return null;
        }
      },
      onSaved: (Value) {
        nameString = Value!.trim();
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            color: Colors.black,
            size: 32.0,
          ),
          labelText: 'Email :',
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          helperText: 'Type your Email for Displat',
          helperStyle: TextStyle(fontStyle: FontStyle.italic)),
      validator: (value) {
        if (!(value!.contains('@gmail') && value.contains('.com'))) {
          return 'Please Type Email in Exp. U@gmail.com';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        emailString = value!.trim();
      },
    );
  }

  Widget passText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.password,
            color: Colors.black,
            size: 32.0,
          ),
          labelText: 'Password :',
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          helperText: 'Type your Password more 6 Charator',
          helperStyle: TextStyle(fontStyle: FontStyle.italic)),
      validator: (value) {
        if (value!.length < 6) {
          return 'Password More 6 Charactor';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        passwordString = value!.trim();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Register'),
        actions: [registerButton()],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[nameText(), emailText(), passText()],
        ),
      ),
    );
  }
}
