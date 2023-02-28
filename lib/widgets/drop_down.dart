import 'package:flutter/material.dart';

class Drowdown extends StatefulWidget {
  const Drowdown({super.key});

  @override
  State<Drowdown> createState() => _DrowdownState();
}

class _DrowdownState extends State<Drowdown> {
  String currentModel = "Model1";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: [],
      value: currentModel,
      onChanged: (value) {
        setState(() {
          currentModel = value.toString();
        });
      },
    );
  }
}
