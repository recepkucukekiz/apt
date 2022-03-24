import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage2 extends StatelessWidget{
  final String text;
  const TestPage2({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return(
    Scaffold(
      appBar: AppBar(
        title: const Text("test2"),
      ),
      body:  Center(
        child: Text(text),
      ),
    )
    );
  }

}