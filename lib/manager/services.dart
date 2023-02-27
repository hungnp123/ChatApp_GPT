import 'package:flutter/material.dart';
import '../widgets/text_widget.dart';
import 'constants.dart';
class Services {
  static Future<void> showModalSheet({required BuildContext context}) async {
    await showModalBottomSheet(
      backgroundColor: scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: const [
              Flexible(
                  child: TextWidget(
                label: "choose model: ",
                fontSize: 16,
              ))
            ],
          ),
        );
      },
    );
  }
}
