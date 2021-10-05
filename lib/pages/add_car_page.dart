// ignore_for_file: prefer_const_constructors

import 'package:cars/api/brands_api.dart';
import 'package:cars/models/_brand.dart';
import 'package:cars/models/_car.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCar extends StatefulWidget {
  const AddCar({Key? key, required this.onAddCar}) : super(key: key);
  final Function(Car) onAddCar;

  @override
  _AddCarState createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  var nomeTextController = TextEditingController();
  var priceTextController = TextEditingController();
  var brandName = "";

  var brandsApi = new BrandsAPI();
  late Future<List<Brand>> brands;

  @override
  void initState() {
    super.initState();
    brands = brandsApi.fetchBrands();
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
        Container(
          child: FutureBuilder<List<Brand>>(
            future: brands,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return ListTile(
                  title: DropdownButtonFormField<String>(
                    hint: Text('Marca'),
                    items: snapshot.data!.map((Brand brand) {
                      return DropdownMenuItem<String>(
                        value: brand.nome,
                        child: Text(brand.nome),
                      );
                    }).toList(),
                    onChanged: (brand) {
                      brandName = brand!;
                    },
                  ),
                );
              }
            },
          ),
        ),
        ListTile(
          title: TextField(
            decoration: InputDecoration(
              hintText: "Nome",
            ),
            controller: nomeTextController,
          ),
        ),
        ListTile(
          title: TextField(
            decoration: InputDecoration(
              hintText: "Preço",
            ),
            controller: priceTextController,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Brand brand = Brand(nome: brandName, codigo: "123");

            String name = nomeTextController.text;
            double price = double.parse(priceTextController.text);
            Car car = Car(name: name, price: price, brand: brand);

            widget.onAddCar(car);
            Navigator.pop(context);
          },
          child: Text("Salvar"),
        )
      ],
    );
  }
}
