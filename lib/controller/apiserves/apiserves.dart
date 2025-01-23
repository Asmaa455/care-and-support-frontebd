import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:supcar/constent/link.dart';
import 'package:supcar/main.dart';
import 'package:supcar/model/conModel.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:cookie_jar/src/default_cookie_jar.dart';
import 'package:supcar/model/doctorModel.dart';
import 'package:supcar/model/healthyValueModel.dart';
import 'package:supcar/model/helpModel.dart';
import 'package:supcar/model/medicineModel.dart';
import 'package:supcar/model/postModel.dart';
import 'package:http_parser/http_parser.dart'; // Required for MediaType
import 'package:path/path.dart' as p;

class ApiService {
  String _csrfToken = '';
  final cookieJar = CookieJar();
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'User-Agent': 'MyApplication',
    'Authorization': 'Bearer ${sharedPref.getString('token')}'
  };

  Future<List<Consultations>> fetchConsultation(String url, int id) async {
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
      print('Response statusCode: ${response.statusCode}');

      print('Response: ${response}');
      if (response.statusCode == 200 || response.statusCode == 201) {
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

  // postRequest1WithFile(
  //     String url, Map<dynamic, dynamic> body, File file) async {
  //   // تأكد من جلب رمز CSRF إذا لم يكن موجودًا
  //   print(url);
  //   print(headers);
  //   print(body);
  //   print(json.encode(body));
  //   var request = http.MultipartRequest('POST', Uri.parse(url));
  //   var length = await file.length();
  //   var stream = http.ByteStream(file.openRead());
  //   var multipartFile = http.MultipartFile('image', stream, length,
  //       filename: basename(file.path));
  //   request.files.add(multipartFile);
  //   body.forEach((key, value) {
  //     request.fields[key] = value; // Add key-value pairs to the request
  //   });
  //   var myrequest = await request.send();
  //   var response = await http.Response.fromStream(myrequest);

  //   print('Response: ${response}');
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     var responsebody = json.decode(response.body);
  //     return responsebody;
  //   } else {
  //     return {
  //       'status': 'error',
  //       'message': 'Failed to post data. Status code: ${response.statusCode}'
  //     };
  //   }
  // }

  Future<dynamic> postRequest1WithFile(
      String url, Map<String, dynamic> body, File file) async {
    try {
      print('URL: $url');
      print('Body: $body');
      print('File length: ${file.length} bytes');

      var request = http.MultipartRequest('POST', Uri.parse(url));

      var length = await file.length();
      var stream = http.ByteStream(file.openRead());
      var multipartFile = http.MultipartFile('image', stream, length,
          filename: p.basename(file.path));
      request.files.add(multipartFile);

      // Add form data
      body.forEach((key, value) {
        request.fields[key] = value.toString(); // Ensure all values are strings
      });

      // Send the request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print('Response: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body); // Return parsed JSON response
      } else {
        return {
          'status': 'error',
          'message': 'Failed to post data. Status code: ${response.statusCode}'
        };
      }
    } catch (e) {
      return {'status': 'error', 'message': 'Exception occurred: $e'};
    }
  }

  Future sendPostFilesForPatient(
      String url, File file1, File? file2, Map<String, String> data) async {
    try {
      // Create a multipart request
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add the first file
      request.files.add(
        await http.MultipartFile.fromPath(
          'image', // Name of the parameter for the first file
          file1.path,
          contentType: MediaType('application', 'octet-stream'), // File type
        ),
      );

      // Add the second file
      if (file2 != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'paper_to_prove_cancer', // Name of the parameter for the second file
            file2.path,
            contentType: MediaType('application', 'octet-stream'), // File type
          ),
        );
      }

      // Add additional data (fields)
      data.forEach((key, value) {
        request.fields[key] = value; // Add key-value pairs to the request
      });

      // Send the request
      var response = await request.send();

      // Handle the response
      if (response.statusCode == 200) {
        print('Files and data uploaded successfully!');
        var responseBody = await response.stream.bytesToString();
        print('Response: $responseBody');
      } else {
        print('Failed to upload files and data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading files and data: $e');
    }
  }

  Future<List<HelpModel>> fetchHelp(String url, int id) async {
    // تأكد من جلب رمز CSRF إذا لم يكن موجودًا
    // if (_csrfToken.isEmpty) {
    //   await fetchCsrfToken();
    // }
    print('$url$id');
    final response = await http.get(Uri.parse('$url$id'), headers: headers);
    print(response.statusCode);
    print(response.body);
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

  Future<List<Medicinemodel>> fetchMedicine() async {
    // تأكد من جلب رمز CSRF إذا لم يكن موجودًا
    // if (_csrfToken.isEmpty) {
    //   await fetchCsrfToken();
    // }

    final response = await http.get(Uri.parse('$serverLink$medicShowLink'),
        headers: headers);

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      print(responseBody);
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

  Future<List<Healthyvaluemodel>> fetchHeathlyValue(
      int id, int diseaseId) async {
    String url = '$serverLink$healthyValueLink$id/$diseaseId';
    print(url);
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);

      print(responseBody);
      var data = responseBody as List;
      return data.map((value) => Healthyvaluemodel.fromJson(value)).toList();
    } else {
      throw Exception('Failed to load consultations');
    }
  }

  Future<List<Doctor>> fetchDoctor() async {
    String url = '$serverLink$doctorLink';
    print(url);
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);

      print(responseBody);
      var data = responseBody as List;
      return data.map((value) => Doctor.fromJson(value)).toList();
    } else {
      throw Exception('Failed to load consultations');
    }
  }

  Future<List<Doctor>> searchDoctor(
      String? name, String? specialization, String? clinicoLcation) async {
    String? url;
    print(name);
    print(specialization);
    print(clinicoLcation);

    if (name == '' && specialization == '' && clinicoLcation == '') {
      url = '$serverLink$searchdoctorLink';
    } else if (name != '' && specialization == '' && clinicoLcation == '') {
      url = '$serverLink$searchdoctorLink?name=$name';
    } else if (name == '' && specialization != '' && clinicoLcation == '') {
      url = '$serverLink$searchdoctorLink?specialization=$specialization';
    } else if (name == '' && specialization == '' && clinicoLcation != '') {
      url = '$serverLink$searchdoctorLink?clinic_location=$clinicoLcation';
    } else if (name != '' && specialization != '' && clinicoLcation == '') {
      url =
          '$serverLink$searchdoctorLink?name=$name&specialization=$specialization';
    } else if (name != '' && specialization == '' && clinicoLcation != '') {
      url =
          '$serverLink$searchdoctorLink?name=$name&clinic_location=$clinicoLcation';
    } else if (name == '' && specialization != '' && clinicoLcation != '') {
      url =
          '$serverLink$searchdoctorLink?specialization=$specialization&clinic_location=$clinicoLcation';
    } else if (name != '' && specialization != '' && clinicoLcation != '') {
      url =
          '$serverLink$searchdoctorLink?name=$name&specialization=$specialization&clinic_location=$clinicoLcation';
    } else {
      url = '$serverLink$searchdoctorLink';
    }

    print(url);
    print(name);
    print(specialization);
    print(clinicoLcation);
    final response = await http.get(Uri.parse(url!), headers: headers);
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);

      print(responseBody);
      var data = responseBody as List;
      return data.map((value) => Doctor.fromJson(value)).toList();
    } else {
      throw Exception('Failed to load consultations');
    }
  }
}
