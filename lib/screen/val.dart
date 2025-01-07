import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sspkm/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class login11 extends StatelessWidget {
  const login11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final gloablekey = GlobalKey<FormState>();
    final Email_controler = TextEditingController();
    final pass_controler = TextEditingController();
    UserCredential? userCredential;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => home_screen(),
                  ));
            },
            child: Text(
              "Skip >>",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: height * 0.30,
                    width: width * 0.65,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Welcome ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: width * 0.1,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "We need to register your registration no before ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.038,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "getting started!",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: width * 0.038,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.app_registration_outlined,
                      color: Colors.black,
                    ),
                    hintText: "email",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Colors.indigo)),
                  ),
                  controller: Email_controler,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    hintStyle: TextStyle(),
                    prefixIcon: Icon(
                      Icons.call,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Colors.indigo)),
                  ),
                  controller: pass_controler,
                ),
                SizedBox(
                  height: 20,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    height: height * 0.063,
                    width: width * 0.92,
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        userCredential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: Email_controler.text,
                                password: pass_controler.text);
                        FirebaseFirestore.instance
                            .collection("users")
                            .doc(userCredential!.user!.uid)
                            .set({
                          "email": Email_controler.text,
                          "password": pass_controler.text,
                        }).then((value) => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => home_screen())));
                      } catch (e) {}
                    },
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 22),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
