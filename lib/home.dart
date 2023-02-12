import 'package:fist_wear/mainpage.dart';
import 'package:fist_wear/register.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Method
  Widget skipButton() {
    return IconButton(
        onPressed: () {
          MaterialPageRoute materialPageRoute1 =
              MaterialPageRoute(builder: (BuildContext context) => Mainpage());
          Navigator.of(context).push(materialPageRoute1);
        },
        icon: Icon(Icons.skip_next));
  }

  Widget SignInButton() {
    // ignore: prefer_const_constructors
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 14, 14, 14),
            foregroundColor: Colors.green),
        onPressed: () {},
        child: Text('Sign In'));
  }

  Widget singUPButton() {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.black, foregroundColor: Colors.blue),
        onPressed: () {
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => Register());
          Navigator.of(context).push(materialPageRoute);
        },
        child: Text('Sing Up'));
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SignInButton(),
        SizedBox(
          width: 3.0,
        ),
        singUPButton()
      ],
    );
  }

  Widget showLogo() {
    return Container(
        width: 120.0, height: 120.0, child: Image.asset('image/icon.png'));
  }

  Widget showAppName() {
    return Text(
      'Ung Shopping Mall',
      style: TextStyle(
          fontSize: 30.0,
          color: Color.fromARGB(255, 99, 178, 243),
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  colors: [Colors.white, Colors.red], radius: 1.0)),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                showLogo(),
                showAppName(),
                SizedBox(
                  height: 8.0,
                ),
                showButton(),
                skipButton()
              ])),
        ),
      ),
    );
  }
}
