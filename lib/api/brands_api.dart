import 'package:cars/models/_brand.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BrandsAPI {
  Future<Brand> fetchBrands() async {
    final response = await http
        .get(Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas'));

    if (response.statusCode == 200) {
      return Brand.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Deu erro!!');
    }
  }
}
