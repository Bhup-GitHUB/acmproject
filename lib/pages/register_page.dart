import 'package:flutter/material.dart';
import 'package:acm/pages/my_textfeild.dart'; 
import 'package:acm/my_buttons.dart'; 

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  String _errorMessage = '';

  void register() async {
    // Show loading indicator
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    // Validate passwords match
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Passwords do not match';
      });
      return;
    }

    // Simulate user registration process
    await Future.delayed(Duration(seconds: 2)); // Remove this line in actual implementation

    // For actual implementation, use Firebase Auth or your backend API to create the user
    try {
      // Example: await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //   email: _emailController.text,
      //   password: _passwordController.text,
      // );

      setState(() {
        _isLoading = false;
      });

      // Navigate to the next screen or show success message
      print('User registered successfully');
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to register user';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                hinttext: "Username",
                obscuretext: false,
                controller: _usernameController,
              ),
              SizedBox(height: 10),
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
              MyTextfeild(
                hinttext: "Confirm Password",
                obscuretext: true,
                controller: _confirmPasswordController,
              ),
              SizedBox(height: 10),
              if (_isLoading) CircularProgressIndicator(),
              if (!_isLoading)
                MyButton(
                  text: "Register",
                  onTap: register,
                ),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the login page or handle login flow
                      print('Navigate to login page');
                    },
                    child: Text(
                      "Login here",
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
