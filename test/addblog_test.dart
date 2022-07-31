import 'package:blogapp/NetworkHandler.dart';
import 'package:blogapp/Pages/SinInPage.dart';
import 'package:blogapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  test('Wrong User Name And Password Canot Login', () async {
    Map<String, String> data = {
                    'title':"Gopal Thapa",               
                    "body": 'Student of LA',
                    "comment": '01/02/2000', 
                  };
   
    NetworkHandler networkHandler = NetworkHandler();
    print("hello");
    var result = await networkHandler.post2("/blogpost/Add",data);
    print(result.statusCode);
    expect(result.statusCode, 200);
  });
}
