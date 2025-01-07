import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sspkm/screen/home.dart';  // Adjust the import based on your file structure
import 'package:sspkm/screen/registration.dart';  // Import the Registration Page
import '../common_widget/Comman_Container.dart';
import '../common_widget/Comman_TeextFiled.dart';
import '../common_widget/Comman_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Method to handle login
  Future<void> loginUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Attempt to sign in with email and password
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(), // Use email entered by the user
          password: passwordController.text.trim(),
        );

        // Show success message
        _showToast("Login Successful");

        // Navigate to Home Screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const home_screen()),
        );
      } on FirebaseAuthException catch (e) {
        // Handle errors like wrong password, user not found, etc.
        if (e.code == 'user-not-found') {
          _showToast("User not found. Please check your email.");
        } else if (e.code == 'wrong-password') {
          _showToast("Incorrect password. Please try again.");
        } else {
          _showToast("Error: ${e.message}");
        }
      }
    }
  }

  // Helper method to show Toast message
  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffEFF5FE),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // Logo
              Center(
                child: Image.asset(
                  "assets/images/logo.png",  // Replace with your logo path
                  height: height * 0.25,
                  width: width * 0.6,
                ),
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: width * 0.08,
                ),
              ),
              const SizedBox(height: 20),

              // Email Field
              Comman_TexxtFiled(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                hinttext: "Enter your email",
                prefixicon: const Icon(Icons.email, color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.black)
                ),
                focouseborder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.blue)
                ),
                FocusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.red)
                ),
                disableborder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.black)
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.red)
                ),
              ),
              const SizedBox(height: 20),

              // Password Field
              Comman_TexxtFiled(
                controller: passwordController,
                obscureText: true,
                hinttext: "Enter your password",
                prefixicon: const Icon(Icons.lock, color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.black)
                ),
                focouseborder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.blue)
                ),
                FocusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.red)
                ),
                disableborder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.black)
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.red)
                ),
              ),
              const SizedBox(height: 30),

              // Login Button
              Comman_Container(
                height: height * 0.06,
                width: width,
                color: Colors.blue,
                BorderRadius: BorderRadius.circular(40),
                ontap: loginUser,
                child: Center(
                  child: Comman_Text(
                    text: "Login",
                    color: Colors.white,
                    fontweight: FontWeight.bold,
                    fontsize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Sign Up Link
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegistrationPage()),
                  );
                },
                child: Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
