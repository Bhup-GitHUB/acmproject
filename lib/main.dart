import 'package:acm/firebase_options.dart';
import 'package:acm/pages/login_page.dart';
import 'package:acm/pages/register_page.dart';
import 'package:acm/balance_manager.dart';
import 'package:acm/theme/darktheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:acm/auth/login_or_register.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BalanceManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginOrRegister(),
        theme: darkmode,
      ),
      );
  }
}
