// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCar extends StatefulWidget {
  const AddCar({Key? key}) : super(key: key);

  @override
  _AddCarState createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  // final _controller = new TextEditingController();

  var count = 1;
  num totalCost = 0;

  @override
  void initState() {
    super.initState();
    // totalCost = 0;
    // _controller.text = "1";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF181725),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Add car"),
      ),
      body: getBody(),
    );
  }

  Column getBody() {
    return Column(
      children: <Widget>[
        ListTile(
          title: TextField(
            decoration: InputDecoration(
              hintText: "Marca",
            ),
          ),
        ),
        ListTile(
          title: TextField(
            decoration: InputDecoration(
              hintText: "Nome",
            ),
          ),
        ),
        ListTile(
          title: TextField(
            decoration: InputDecoration(
              hintText: "Preço",
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("Salvar"),
        )
      ],
    );
  }
}
