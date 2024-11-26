import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:supcar/constent/link.dart';
import 'package:supcar/model/conModel.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:cookie_jar/src/default_cookie_jar.dart';

class ApiService {
  // final String baseUrl = 'http://127.0.0.1:8000/';
  final cookieJar = CookieJar();
  Map<String, String> headers = {
    'content-Type': 'appliction/json',
    'UserAgent': 'MyApplication',
    'X-XSRF-TOKEN': '{{xsrf-token }}'
  };
  Future<List<Consultations>> fetchConsultation(int id) async {
    final response = await http
        .get(Uri.parse('$serverLink$consultationPatient$id'), headers: headers);

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

  Future<Map<String, dynamic>> postRequest1(
      String url, Map<String, String> body) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        return {
          'status': 'error',
          'message': 'Failed to post data. Status code: ${response.statusCode}'
        };
      }
    } catch (e) {
      // Handle error
      return {'status': 'error', 'message': e.toString()};
    }
  }

  Future<List<Consultations>> fetchConsultationForDoctor() async {
    final response = await http.get(
        Uri.parse('$serverLink$consultationForDoctorLink'),
        headers: headers);

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      return responseBody
          .map((consultation) => Consultations.fromJson(consultation))
          .toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
