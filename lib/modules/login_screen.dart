// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:schoolchat/shared/components/components.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();

  String? email;

  String? password;

  var FormKey = GlobalKey<FormState>();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: Center(child: CircularProgressIndicator()),
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: const Color(0xff274460),
        body: Loginscreen(
            FormKey: FormKey,
            onChanged1: (data) {
              email = data;
            },
            onChanged2: (data) {
              password = data;
            },
            emailcontroller: emailcontroller,
            passwordcontroller: passwordcontroller,
            text: "LOGIN",
            accountText: "do not have account ? ",
            buttonText: "Sign up",
            defaultbuttonText: "Sign In",
            ButtonFun: () async {
              if (FormKey.currentState!.validate()) {
                setState(() {
                  isloading = true;
                });
                try {
                  await Loginuser(email, password);
                  Navigator.pushNamed(context, 'Chatpage',arguments: email);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    Showmessage(context, "No user found for that email.");
                  } else if (e.code == 'wrong-password') {
                    Showmessage(
                        context, "Wrong password provided for that user.");
                  }
                } catch (e) {
                  print(e);
                }
                setState(() {
                  isloading = false;
                });
              }
            },
            TextButtonFun: () {
              Navigator.pushNamed(context, "Registerpage");
            }),
      ),
    );
  }
}
