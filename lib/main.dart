import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:schoolchat/firebase_options.dart';
import 'package:schoolchat/layout/chatpage.dart';
import 'package:schoolchat/modules/login_screen.dart';
import 'package:schoolchat/modules/register_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SchoolarChat());
}

class SchoolarChat extends StatelessWidget {
  const SchoolarChat({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "Loginpage":(context) =>  LoginPage(),
        "Registerpage":(context) => const Registerscreen(),
        "Chatpage":(context) =>  Chatpage(),
      },
      initialRoute:"Loginpage",
    );
  }
}
