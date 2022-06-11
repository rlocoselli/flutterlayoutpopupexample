import 'package:flutter/material.dart';
import 'dart:math';

class HypotenusePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hypotenuse',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hypotenuse'),
        ),
        body: HypotenuseWidget(),
      ),
    );
  }
}

class HypotenuseWidget extends StatefulWidget {
  @override
  _HypotenuseState createState() => _HypotenuseState();
}

class _HypotenuseState extends State<HypotenuseWidget> {
  String hypotenuse = '0';
  double adjacent = 0;
  double opposite = 0;

  final TextEditingController adjacentController = TextEditingController();
  final TextEditingController oppositeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    hypotenuse = '0';
    adjacentController.addListener(updateAdjacent);
    oppositeController.addListener(updateOpposite);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15.0),
        child: Column(
          children: <Widget>[
            HypotenuseTextField(adjacentController, 'Adjacent'),
            HypotenuseTextField(oppositeController, 'Opposite'),
            ElevatedButton(
              child: Text(
                'Get Hypotenuse',
                style: TextStyle(fontSize: 18.0),
              ),
              onPressed: getHypotenuse,
            ),
            Text(
              hypotenuse,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.green[700],
              ),
            ),
          ],
        ));
  }

  void getHypotenuse() {
    double hyp;

    hyp = sqrt(adjacent * adjacent + opposite * opposite);

    setState(() {
      hypotenuse = 'Hypotenuse is ${hyp.toString()}';
    });
  }

  void updateAdjacent() {
    setState(() {
      if (adjacentController.text != '') {
        adjacent = double.parse(adjacentController.text);
      } else {
        adjacent = 0;
      }
    });
  }

  void updateOpposite() {
    setState(() {
      if (oppositeController.text != '') {
        opposite = double.parse(oppositeController.text);
      } else {
        opposite = 0;
      }
    });
  }
}

class HypotenuseTextField extends StatelessWidget {
  HypotenuseTextField(this.controller, this.hint);

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15.0),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: TextStyle(
              color: Colors.green[700],
              fontWeight: FontWeight.w300,
              fontSize: 24.0),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.calculate_rounded),
            filled: true,
            fillColor: Colors.grey[300],
            hintText: hint,
          ),
        ));
  }
}
