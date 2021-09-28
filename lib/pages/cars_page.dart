import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({Key? key}) : super(key: key);

  @override
  _CarsPageState createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carangas"),
        elevation: 0,
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
