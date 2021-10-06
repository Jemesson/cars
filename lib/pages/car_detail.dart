import 'package:flutter/cupertino.dart';
import 'package:cars/models/_car.dart';
import 'package:flutter/material.dart';

class CarDetail extends StatelessWidget {
  final Car car;

  const CarDetail({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF181725),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "${car.name}",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/images/sports_car.png",
                  height: 200,
                  width: 200,
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  car.brand.nome,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  car.name,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("\$ ${car.price}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
