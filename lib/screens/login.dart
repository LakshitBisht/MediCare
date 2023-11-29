import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare/screens/home.dart';
import 'package:medicare/screens/signup.dart';
import 'package:medicare/utils/colors.dart';
import 'package:medicare/widgets/custom_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("191717"),
          hexStringToColor("272829"),
          hexStringToColor("D71313")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(children: <Widget>[
            logoWidget("assets/images/logo.png"),
            SizedBox(
              height: 30,
            ),
            inputTextField("Enter Username", Icons.person_outline, false,
                _emailTextController),
            SizedBox(
              height: 30,
            ),
            inputTextField("Enter Password", Icons.lock_outline, true,
                _passwordTextController),
            SizedBox(
              height: 30,
            ),
            authButton(context, true, () {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                  .then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }).onError((error, stackTrace) {
                print("Error ${error.toString()} ");
              });
            }),
            signUpLink()
          ]),
        )),
      ),
    );
  }

  Row signUpLink() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text("Don't Have an Account?",
          style: TextStyle(color: Colors.white70)),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignupScreen()));
        },
        child: const Text(
          " Sign Up",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
