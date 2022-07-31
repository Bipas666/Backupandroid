import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseurl = "http://172.25.0.56:180";
  var log = Logger();
  FlutterSecureStorage storage = FlutterSecureStorage();
  
  Future get(String url) async {
    String token = await storage.read(key: "token");
    url = formater(url);
    // /user/register
    var response = await http.get(Uri.parse(
      url,),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);

      return json.decode(response.body);
    }
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<http.Response> post(String url, Map<String, String> body) async {
    String token = await storage.read(key: "token");
    url = formater(url);
    log.d(body);
    var response = await http.post(Uri.parse(
      url,),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }
  Future<http.Response> posted(String url, Map<String, String> body) async {
    String token = await storage.read(key: "token");
    url = formater(url);
    log.d(body);
    var response = await http.post(Uri.parse(
      url,),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }
  Future<http.Response> delete(String url ) async {
    
    String token = await storage.read(key: "token");
    url = formater(url);
    
    print(url);
    var response = await http.delete(Uri.parse(
      url,),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      },
    
    );
    print(response);
    return response;
  }
  

  Future<http.Response> patch(String url, Map<String, String> body) async {
    String token = await storage.read(key: "token");
    url = formater(url);
    log.d(body);
    var response = await http.patch(Uri.parse(
      url,),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.StreamedResponse> patchImage(String url, String filepath) async {
    url = formater(url);
    String token = await storage.read(key: "token");
    var request = http.MultipartRequest('PATCH', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath("img", filepath));
    request.headers.addAll({
      "Content-type": "multipart/form-data",
      "Authorization": "Bearer $token"
    });
    var response = request.send();
    return response;
  }

  String formater(String url) {
    return baseurl + url;
  }

  NetworkImage getImage(String imageName) {
    String url = formater("/uploads/$imageName.jpg");
    return NetworkImage(url);
  }

  //For Testing:
  Future<http.Response> patch1(String url, Map<String, String> body) async {
    url = formater(url);
    log.d(body);
    var response = await http.patch(Uri.parse(
      url,),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhbTEyMzQiLCJpYXQiOjE2NDYxNTI1NDF9.Pqp460hyszMF_t7cc5ycRNtMbXuTEYINRkenGFhMBLs"
      },
      body: json.encode(body),
    );
    return response;
  }
  Future<http.Response> delete1(String url ) async { 
    url = formater(url);

    print(url);
    var response = await http.delete(Uri.parse(
      url,),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhbTEyMzQiLCJpYXQiOjE2NDYxNTI1NDF9.Pqp460hyszMF_t7cc5ycRNtMbXuTEYINRkenGFhMBLs" 
      },
    );
    print(response);
    return response;
  }
  Future<http.Response> post1(String url, var body) async {
    url = formater(url);
    log.d(body);
    print("heloo");
    var response = await http.post(Uri.parse(
      url,),
      headers: {
        "Content-type": "application/json",
      },
      body: json.encode(body),
    );
    return response;
  }
  Future<http.Response> post2(String url, var body) async {
    url = formater(url);
    log.d(body);
    print("heloo");
    var response = await http.post(Uri.parse(
      url,),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhbTEyMzQiLCJpYXQiOjE2NDYxNTI1NDF9.Pqp460hyszMF_t7cc5ycRNtMbXuTEYINRkenGFhMBLs"
      },
      body: json.encode(body),
    );
    return response;
  }
}

