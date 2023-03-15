import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/signuppage.dart';

import 'firebaseUiButton.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
           child: Padding(
             padding: EdgeInsets.fromLTRB(
                 20,MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
            children: <Widget>[
              Text(
                  "Welcome Back",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              reusableTextField("Enter Username", Icons.person_outline, false,
                  _emailTextController),
              const SizedBox(
                height: 30,
              ),
              reusableTextField("Enter Password", Icons.lock_outline, true,
                  _passwordTextController),
              const SizedBox(
                height: 30,
              ),
              // Container(
              //   width: 280,
              //     height: 80,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(10))
              //     ),
              //     padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
              //      ElevatedButton(
              //          child: const Text('Login'),
              //       onPressed: () {
              //         Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
              //       },
              //     ),

                  firebaseUIButton(context, "Sign In", () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                        .then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  }),

              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 20, 30, 20),
                child: Row(
                    children: [
                      Text(
                          "Don't have an account ? "
                      ),
                      FlatButton(

                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),));

                        },
                        child: Text("Register"),
                      )
                    ]
                ),
              )
            ],
            ),

),
        ),
      ),
    );
  }
}






TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.black,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.grey.withOpacity(0.2),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)
      ),

    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
