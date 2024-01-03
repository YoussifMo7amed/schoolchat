// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schoolchat/models/chatModel.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  Color TextColor = Colors.black,
  bool isUpperCase = true,
  double radius = 3.0,
  required void Function() function,
  required String text,
}) =>
    Container(
        color: background,
        width: width,
        height: 50.0,
        child: MaterialButton(
          onPressed: function,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(color: TextColor, fontWeight: FontWeight.bold),
          ),
        ));
Widget dfaultFormField(
        {required TextEditingController controller,
        required TextInputType type,
        void Function(String)? onChange,
        void Function(String)? onsubmit,
        String? Function(String?)? validator,
        required String label,
        required IconData? prefix,
        bool ispassword = false,
        IconData? sufix,
        void Function()? ontap,
        void Function()? sufixFunction,
        String? hinttext
        }) =>
    TextFormField(
      
      controller: controller,
      keyboardType: type,
      obscureText: ispassword,
      onChanged: onChange,
      onFieldSubmitted: onsubmit,
      validator: validator,
      onTap: ontap,
      decoration: InputDecoration(
        hintText: hinttext,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          prefixIcon: Icon(prefix),
          suffixIcon: sufix != null
              ? IconButton(onPressed: sufixFunction, icon: Icon(sufix))
              : null,
          border: const OutlineInputBorder()),
    );
Widget Loginscreen({
  required var emailcontroller,
  required var passwordcontroller,
  required String text,
  required GlobalKey<FormState> FormKey,
  required String defaultbuttonText,
  required String buttonText,
  required String accountText,
  required void Function() ButtonFun,
  required void Function() TextButtonFun,
  Function(String)? onChanged1,
  Function(String)? onChanged2,
}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Form(
      key: FormKey,
      child: Column(
        children: [
          const Spacer(),
          Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              height: 100,
              width: 100,
              child: Image.asset("assets/images/scholar.png")),
          const Text(
            "Schoolar Chat",
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          dfaultFormField(
            controller: emailcontroller,
            type: TextInputType.emailAddress,
            label: "Email",
            prefix: null,
            onChange: onChanged1,
            validator: (String? value) {
              if (value!.isEmpty) {
                return "Email must not be empty";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          dfaultFormField(
            ispassword: true,
            controller: passwordcontroller,
            type: TextInputType.emailAddress,
            label: "password",
            prefix: null,
            onChange: onChanged2,
            validator: (String? value) {
              if (value!.isEmpty) {
                return "password must not be empty";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          defaultButton(
            
              function: ButtonFun,
              text: defaultbuttonText,
              background: const Color(0xffF2F2F2)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                accountText,
                style: const TextStyle(color: Colors.white),
              ),
              TextButton(
                onPressed: TextButtonFun,
                child: Text(
                  buttonText,
                  style: const TextStyle(color: Color(0xffC2E9E7)),
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          )
        ],
      ),
    ),
  );
}

void Showmessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

Future<void> Registeruser(
    String? email, String? password,) async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email!,
    password: password!,
  );
}
Future<void> Loginuser(
    String? email, String? password, ) async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email!,
    password: password!,
  );
}
class ChatBubble extends StatelessWidget {
  Message message;
  final bool isMe;

  ChatBubble({required this.message, required this.isMe, });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: !isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMe ? 8.0 : 16.0,
          vertical: 4.0,
        ),
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isMe ? Color(0xff284461) : Color(0xff006588),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(!isMe ? 0.0 : 8.0),
              topRight: Radius.circular(isMe ? 16.0 : 0.0),
              bottomRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(!isMe ? 8.0 : 0.0),
            ),
          ),
          child: Text(
           message.message,
            style: TextStyle(color: Colors.white,fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}

