// ignore_for_file: non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:schoolchat/shared/components/components.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
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
            text: "REGISTER",
            accountText: "already have account ? ",
            buttonText: "Sign In",
            defaultbuttonText: "REGISTER",
            ButtonFun: () async {
              if (FormKey.currentState!.validate()) {
                setState(() {
                  isloading = true;
                });
                try {
                  await Registeruser(email, password);
                  Navigator.pushNamed(context, 'Chatpage',arguments: email);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    Showmessage(context, "The password provided is too weak.");
                  } else if (e.code == 'email-already-in-use') {
                    Showmessage(
                        context, "The account already exists for that email.");
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
              Navigator.pop(context);
            }),
      ),
    );
  }
}
