import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:supcar/model/conModel.dart';

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<Consultations>> fetchConsultation(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      var data = responseBody['consultations'] as List;

      return data
          .map((consultation) => Consultations.fromJson(consultation))
          .toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
