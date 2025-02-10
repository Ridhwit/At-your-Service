import 'package:at_your_service/pages/bottomnav.dart';
import 'package:at_your_service/pages/login.dart';
import 'package:at_your_service/services/database.dart';
import 'package:at_your_service/services/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  Future<void> registration() async {
    if (passwordcontroller.text.isNotEmpty &&
        emailcontroller.text.isNotEmpty &&
        namecontroller.text.isNotEmpty) {
      try {
        // ignore: unused_local_variable
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim(),
        );

        String id = randomAlphaNumeric(10);

        Map<String, dynamic> userInfoMap = {
          "email": emailcontroller.text.trim(),
          "Id": id,
          "Name": namecontroller.text.trim(),
        };

        await SharedpreferenceHelper().savedUserEmail(emailcontroller.text);
        await SharedpreferenceHelper().savedUserName(namecontroller.text);
        await SharedpreferenceHelper().savedUserId(id);

        await DatabaseMethods().addUserDetail(userInfoMap, id);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomNav()),
        ); // 🔹 **Fixed missing semicolon**
      } on FirebaseAuthException catch (e) {
        String message = "Something went wrong";
        if (e.code == "weak-password") {
          message = "Password provided is too weak";
        } else if (e.code == "email-already-in-use") {
          message = "Account already exists";
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              message,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset("images/login.png"),
          const SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              controller: namecontroller,
              decoration: const InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(color: Colors.black54, fontSize: 23.0),
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              controller: emailcontroller,
              decoration: const InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.black54, fontSize: 23.0),
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              controller: passwordcontroller,
              decoration: const InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.black54, fontSize: 23.0),
              ),
            ),
            // 🔹 Consider adding `obscureText: true,` for password security.
          ),
          const SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    if (passwordcontroller.text.isNotEmpty &&
                        emailcontroller.text.isNotEmpty &&
                        namecontroller.text.isNotEmpty) {
                      registration();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            "Please fill in all details",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }
                  },
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(60),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Icon(
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
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
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
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: const Text(
                  " Sign in",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
