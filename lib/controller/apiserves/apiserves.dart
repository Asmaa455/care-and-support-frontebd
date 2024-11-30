import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:supcar/constent/link.dart';
import 'package:supcar/model/conModel.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:cookie_jar/src/default_cookie_jar.dart';
import 'package:supcar/model/helpModel.dart';
import 'package:supcar/model/medicineModel.dart';
import 'package:supcar/model/postModel.dart';

class ApiService {
  String _csrfToken = '';
  final cookieJar = CookieJar();
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'User-Agent': 'MyApplication',
  };
  // String token = 'csrf-token';
  // // دالة للحصول على رمز CSRF
  // Future<void> fetchCsrfToken() async {
  //   var url = Uri.parse('$serverLink$token');
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     print(data);
  //     _csrfToken = data['csrf_token'];
  //     headers['X-CSRF-TOKEN'] = _csrfToken; // تحديث الرؤوس هنا
  //   } else {
  //     throw Exception('Failed to fetch CSRF token');
  //   }
  // }

  Future<List<Consultations>> fetchConsultation(String url, int id) async {
    // تأكد من جلب رمز CSRF إذا لم يكن موجودًا
    // if (_csrfToken.isEmpty) {
    //   await fetchCsrfToken();
    // }
    String url1 = '$url$id';
    final response = await http.get(Uri.parse(url1), headers: headers);
    print(url1);
    print(response);
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      var data = responseBody['consultations'] as List;
      return data
          .map((consultation) => Consultations.fromJson(consultation))
          .toList();
    } else {
      throw Exception('Failed to load consultations');
    }
  }

  postRequest1(String url, Map<dynamic, dynamic> body) async {
    // تأكد من جلب رمز CSRF إذا لم يكن موجودًا
    print(url);
    print(headers);
    print(body);
    print(json.encode(body));
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );

      print('Response: ${response}');
      if (response.statusCode == 200) {
        var responsebody = json.decode(response.body);
        return responsebody;
      } else {
        return {
          'status': 'error',
          'message': 'Failed to post data. Status code: ${response.statusCode}'
        };
      }
    } catch (e) {
      return {'status': 'error', 'message': e.toString()};
    }
  }

  Future<List<HelpModel>> fetchhelpForPatient(int id) async {
    // تأكد من جلب رمز CSRF إذا لم يكن موجودًا
    // if (_csrfToken.isEmpty) {
    //   await fetchCsrfToken();
    // }

    final response = await http.get(Uri.parse('$serverLink$patientAidLink$id'),
        headers: headers);

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      var data = responseBody['Patient_Aid'] as List;
      return data.map((help) => HelpModel.fromJson(help)).toList();
    } else {
      throw Exception('Failed to load help: ${response.statusCode}');
    }
  }

  Future<List<HelpModel>> fetchhelpForVolunteer(int id) async {
    // تأكد من جلب رمز CSRF إذا لم يكن موجودًا
    // if (_csrfToken.isEmpty) {
    //   await fetchCsrfToken();
    // }

    final response = await http.get(Uri.parse('$serverLink$patientAidLink$id'),
        headers: headers);

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      return responseBody.map((help) => HelpModel.fromJson(help)).toList();
    } else {
      throw Exception('Failed to load help: ${response.statusCode}');
    }
  }

  Future<List<Medicinemodel>> fetchMedicine(int id) async {
    // تأكد من جلب رمز CSRF إذا لم يكن موجودًا
    // if (_csrfToken.isEmpty) {
    //   await fetchCsrfToken();
    // }

    final response = await http.get(Uri.parse('$serverLink$medicShowLink$id'),
        headers: headers);

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      var data = responseBody["Medication_Time"] as List;
      return data
          .map((medicine1) => Medicinemodel.fromJson(medicine1))
          .toList();
    } else {
      throw Exception('Failed to load help: ${response.statusCode}');
    }
  }

  Future<List<Postmodel>> fetchPost(String url) async {
    // تأكد من جلب رمز CSRF إذا لم يكن موجودًا
    // if (_csrfToken.isEmpty) {
    //   await fetchCsrfToken();
    // }
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      var data = responseBody as List;
      return data.map((post) => Postmodel.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load consultations');
    }
  }

  Future<List<Postmodel>> fetchPostDoc(String url, int id) async {
    // تأكد من جلب رمز CSRF إذا لم يكن موجودًا
    // if (_csrfToken.isEmpty) {
    //   await fetchCsrfToken();
    // }
    final response = await http.get(Uri.parse('$url$id'), headers: headers);
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      var data = responseBody as List;
      return data.map((post) => Postmodel.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load consultations');
    }
  }
}
