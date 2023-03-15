import 'package:flutter/material.dart';
import 'package:flutter_demo/loginpage.dart';
import 'package:flutter_demo/signuppage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
padding: EdgeInsets.fromLTRB(10, 300, 10,60),
        child:ListView(
          children: <Widget>[
           Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                },
              )
          ),
            SizedBox(
              height: 50,
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Register'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),));
                  },
                )
            ),
        ]
        ),

      ),
    );
  }
}
