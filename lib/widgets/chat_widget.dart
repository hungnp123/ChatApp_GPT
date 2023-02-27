import 'package:chat_gpt_app/manager/constants.dart';
import 'package:flutter/material.dart';
import '../manager/assets_manager.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Image.asset(AssestManager.useravtar, height: 30, width: 30,)],
            ),
          ),
        ),
      ],
    );
  }
}
