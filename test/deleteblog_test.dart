import 'package:blogapp/NetworkHandler.dart';
import 'package:blogapp/Pages/SinInPage.dart';
import 'package:blogapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  test('Wrong user name and password canot login', () async {

   
    NetworkHandler networkHandler = NetworkHandler();
    print("hello");
    var result = await networkHandler.delete1("/blogPost/delete/621e4d4adfab482ba05baa92");
    print(result.statusCode);
    expect(result.statusCode, 200);
  });
}
