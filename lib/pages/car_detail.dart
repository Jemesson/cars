import 'package:cars/api/images_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:cars/models/_car.dart';
import 'package:flutter/material.dart';

class CarDetail extends StatelessWidget {
  final Car car;
  final brandsApi = ImagesAPI();
  late final Future<String> imageURL;

  CarDetail({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    imageURL = brandsApi.fetchImageURL("${car.brand.nome} ${car.name}");

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF181725),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          car.name,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Center(
                child: FutureBuilder<String>(
                    future: imageURL,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      } else {
                        return Image.network(
                          (snapshot.data).toString(),
                          fit: BoxFit.cover,
                          height: 300,
                          width: 300,
                        );
                      }
                    }),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  car.brand.nome,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  car.name,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("\$ ${car.price}",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
