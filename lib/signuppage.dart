import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/loginpage.dart';

import 'firebaseUiButton.dart';
import 'homepage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

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
                  "Register",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 40,
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
                //     width: 280,
                //     height: 90,
                //     padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                    // child:
                // ElevatedButton(
                //       child: const Text('Register'),
                //       onPressed: () {
                //         Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                //       },
                //     ),
                  // child:
    firebaseUIButton(context, "Sign Up", () {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
    email: _emailTextController.text,
    password: _passwordTextController.text)
        .then((value) {
    print("Created New Account");
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
                  padding: const EdgeInsets.fromLTRB(85, 20, 40, 20),
                  child: Row(
                    children: [
                      Text(
                      "Already registered ? "
                    ),
                      FlatButton(

                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));

                          },
                        child: Text("Sign In"),
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
