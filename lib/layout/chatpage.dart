// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:schoolchat/models/chatModel.dart';
import 'package:schoolchat/shared/components/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chatpage extends StatelessWidget {
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  var controller = TextEditingController();
  final _controller = ScrollController();
 late bool isme;


  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: messages.orderBy("sendAt", descending: true).snapshots(),
      builder: (context, snapshot) {     
        List<Message>? messagelist = [];
      if (snapshot.data != null) {
    snapshot.data!.docs.forEach((element) {
      messagelist.add(Message.fromjson(element));
    });
  }
        return ConditionalBuilder(
            condition: snapshot.hasData,
            fallback: (context) => Text("Loading.......!"),
            builder: (context) {
              return Scaffold(
                backgroundColor: Color(0xff274460),
                body: Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    backgroundColor: Color(0xff274460),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/scholar.png",
                          height: 50.0,
                        ),
                        Text("chat"),
                      ],
                    ),
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          reverse: true,
                          controller: _controller,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            messagelist[index].Id==email?isme=true:isme=false;
                            return ChatBubble(
                                message: messagelist[index], isMe: isme,);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: TextField(
                          controller: controller,
                          onSubmitted: (data) {
                            messages.add({
                              "message": data,
                              "sendAt": DateTime.now(),
                              "Id":email,
                            });
                            controller.clear();
                            _controller.animateTo(0,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeOut);
                          },
                          decoration: InputDecoration(
                              hintText: "Send Message",
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.send,
                                  color: Color(0xff284461),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
