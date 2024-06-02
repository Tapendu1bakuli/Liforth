import 'package:flutter/material.dart';

class MyCourse extends StatelessWidget {
  const MyCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).focusColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 35.0, top: 25),
        child: Text("My Course"),
      ),
    );
  }
}
