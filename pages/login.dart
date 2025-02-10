import 'package:at_your_service/pages/bottomnav.dart';
import 'package:at_your_service/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "";
      if (e.code == 'user-not-found') {
        errorMessage = "No user found for that email";
      } else if (e.code == "wrong-password") {
        errorMessage = "Wrong Password provided by user";
      }

      if (errorMessage.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              errorMessage,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Container(
        child: Column(
          children: [
            Image.asset("images/signin.png"),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.black54, fontSize: 23.0),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: TextField(
                controller: passwordcontroller,
                obscureText: true, // Hide password input
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.black54, fontSize: 23.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60.0),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (passwordcontroller.text.isNotEmpty &&
                          emailcontroller.text.isNotEmpty) {
                        userLogin();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "Please fill in all details",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }
                    },
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(60),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: Text(
                    " Sign up",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
