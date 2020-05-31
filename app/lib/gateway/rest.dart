import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

get(String url, String body) async{
  Map<String, String> headers = await createHeader();

  http.Response response = await http.get(url, headers: headers);

  return response;
}

post( String url, String body) async{
  Map<String, String> headers = await createHeader();

  http.Response response = await http.post(url, headers: headers, body: body);

  return response;
}

delete(String url) async{
  Map<String, String> headers = await createHeader();
  http.Response response = await http.delete(url, headers: headers);
  return response;
}

patch(String url) async{
  Map<String, String> headers = await createHeader();
  http.Response response = await http.patch(url, headers: headers);
  return response;
}

Future<Map<String, String>> createHeader() async {
  final prefs = await SharedPreferences.getInstance();

  String username = 'admin';
  String password = 'password';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  Map<String, String> headers = {
    "Content-type": "application/json",
    'authorization': basicAuth
  };
  return headers;
}

getURL(){
  //return "http://192.168.137.1:5000";
  return "http://172.25.18.225:5984/";
}
