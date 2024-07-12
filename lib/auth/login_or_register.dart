  import 'package:flutter/material.dart';
  import 'package:acm/pages/login_page.dart'; 
  import 'package:acm/pages/register_page.dart';  

  class LoginOrRegister extends StatefulWidget {
    const LoginOrRegister({Key? key}) : super(key: key);

    @override
    State<LoginOrRegister> createState() => _LoginOrRegisterState();
  }

  class _LoginOrRegisterState extends State<LoginOrRegister> {
    bool _showLoginPage = true;

    void toggleView() {
      setState(() {
        _showLoginPage = !_showLoginPage;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: _showLoginPage ? LoginPage() : RegisterPage()),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _showLoginPage
                      ? "Don't have an account? "
                      : "Already have an account? ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: toggleView,
                  child: Text(
                    _showLoginPage ? "Register Here" : "Login Here",
                    style: TextStyle(
                      color: Colors.white,
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
