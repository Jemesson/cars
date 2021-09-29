import 'package:cars/Entities/_Car.dart';
import 'package:cars/Entities/_brand.dart';
import 'package:cars/widgets/car_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({Key? key}) : super(key: key);

  @override
  _CarsPageState createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  static final cars = [
    Car(name: "nome 1", price: 100.0, brand: Brand(nome: "BMW", codigo: "1")),
    Car(
        name: "nome 2",
        price: 120.0,
        brand: Brand(nome: "Citroën", codigo: "1")),
    Car(name: "nome 1", price: 100.0, brand: Brand(nome: "BMW", codigo: "1")),
    Car(name: "nome 1", price: 100.0, brand: Brand(nome: "BMW", codigo: "1"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Carangas",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2,
            children: cars
                .map((car) => CarWidget(
                      car: car,
                    ))
                .toList(),
          ),
        ));
  }
}
