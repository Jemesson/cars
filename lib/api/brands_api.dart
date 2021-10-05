import 'package:cars/models/_brand.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BrandsAPI {
  Future<List<Brand>> fetchBrands() async {
    final response = await http
        .get(Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Brand>((json) => Brand.fromJson(json)).toList();
    } else {
      throw Exception('Deu erro!!');
    }
  }
}
