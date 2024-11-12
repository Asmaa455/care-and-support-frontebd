import 'package:http/http.dart' as http;
import 'dart:convert';

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
