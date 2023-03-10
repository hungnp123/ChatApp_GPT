import 'package:chat_gpt_app/manager/services.dart';
import 'package:chat_gpt_app/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../manager/assets_manager.dart';
import '../manager/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool imtyping = true;
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssestManager.chatlogo),
        ),
        title: const Text("Chat GPT"),
        actions: [
          IconButton(
            onPressed: () async {
              await Services.showModalSheet(context: context);
            },
            icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ChatWidget(
                    msg: chatMessages[index]["msg"].toString(),
                    chatIndex:
                        int.parse(chatMessages[index]["chatIndex"].toString()),
                  );
                },
              ),
            ),
            if (imtyping) ...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(
                height: 20,
              ),
              Material(
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: textEditingController,
                          onSubmitted: (value) {},
                          decoration: const InputDecoration.collapsed(
                            hintText: "Typing here...",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          try {
                            await ApiService.getModels();
                          } catch (error) {
                            print("error $error");
                          }
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
