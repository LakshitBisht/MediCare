import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicare/screens/home.dart';
import 'package:medicare/screens/login.dart';
import 'package:medicare/utils/colors.dart';
import 'package:medicare/widgets/custom_widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
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
          padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
          child: Column(children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            inputTextField("Enter Username", Icons.person_outline, false,
                _usernameTextController),
            const SizedBox(
              height: 20,
            ),
            inputTextField("Enter Email", Icons.person_outline, false,
                _emailTextController),
            const SizedBox(
              height: 20,
            ),
            inputTextField("Enter Password", Icons.lock_outline, true,
                _passwordTextController),
            const SizedBox(
              height: 20,
            ),
            authButton(context, false, () {
              FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text,
              )
                  .then((user) {
                FirebaseAuth.instance.currentUser
                    ?.updateDisplayName(_usernameTextController.text)
                    .then((value) => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()))
                        });
              }).onError((error, stackTrace) {
                print("Error ${error.toString()}");
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
      const Text("Already a User?", style: TextStyle(color: Colors.white70)),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        },
        child: const Text(
          " Login",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
