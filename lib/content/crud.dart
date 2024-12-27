import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:supcar/constent/link.dart';

mixin Crud {
  getRequest(String ur1) async {
    try {
      var response = await http.get(Uri.parse(ur1));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print('ERROR ${response.statusCode}');
      }
    } catch (e) {
      print('ERROR CATCH $e');
    }
  }

  postRequest(String ur1, Map data) async {
    try {
      var response = await http.post(Uri.parse(ur1), body: data);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print('ERROR ${response.statusCode}');
      }
    } catch (e) {
      print('ERROR CATCH $e');
    }
  }
}

Future<void> getMedicalConsultation(String url, int id) async {
  String myUrl = '$url$id';
  try {
    var response = await http.get(Uri.parse(myUrl));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      var responsebody = json.decode(response.body);
      return responsebody; // Handle the data as needed
    } else {
      // If the server returns an error response.
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Caught an error: $e');
  }
}
