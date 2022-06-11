import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 96, 4, 139),
          brightness: Brightness.light),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout in Flutter Test'),
      ),
      body: const Center(
        child: Text('Example Layout'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showQuestionDialog(context);
        },
        child: const Icon(Icons.lightbulb_outline),
      ),
      persistentFooterButtons: <Widget>[
        IconButton(
          icon: const Icon(Icons.lightbulb_outline),
          onPressed: () {
            showQuestionDialog(context);
          },
        ),
        IconButton(
          icon: const Icon(Icons.lightbulb_sharp),
          onPressed: () {
            print('IconButton pressed');
          },
        ),
      ],
    );
  }

  void showQuestionDialog(BuildContext ctx) {
    AwesomeDialog(
      context: ctx,
      dialogType: DialogType.QUESTION,
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Question',
      desc: 'Dialog description here...',
      buttonsTextStyle: const TextStyle(color: Colors.black),
      showCloseIcon: true,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }
}
