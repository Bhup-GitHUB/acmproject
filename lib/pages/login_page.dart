import 'package:acm/home_page.dart';
import 'package:flutter/material.dart';
import 'package:acm/pages/my_textfeild.dart';
import 'package:acm/my_buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void login(BuildContext context) {
    // Navigate to the next page
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: 74,
                color: Colors.white,
              ),
              SizedBox(height: 30),
              Text(
                "H A C K A T H O N",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              MyTextfeild(
                hinttext: "Email",
                obscuretext: false,
                controller: _emailController,
              ),
              SizedBox(height: 10),
              MyTextfeild(
                hinttext: "Password",
                obscuretext: true,
                controller: _passwordController,
              ),
              SizedBox(height: 10),
              Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
              SizedBox(height: 10),
              MyButton(
                text: "Login",
                onTap: () {
                  print('Login button pressed');
                  login(context);
                },
              ),
              SizedBox(height: 10),
              MyButton(
                text: "Navigate to Next Page",
                onTap: () {
                  login(context);
                },
              ),
              SizedBox(height: 10),
              // Sign-up section placeholder
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the registration page or handle sign-up flow
                      print('Navigate to sign-up page');
                    },
                    child: Text(
                      "Register Here",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


