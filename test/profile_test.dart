import 'package:blogapp/NetworkHandler.dart';

import 'package:blogapp/Pages/SinInPage.dart';

import 'package:blogapp/main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Wrong user name and password canot login', () async {
    Map<String, String> data = {
                    "name": 'Gopal Thapa',               
                    "profession": 'Student',
                    "DOB": '01/02/2020',
                    "titleline": 'Studing',
                    "about": 'Great',
                  };
    
    NetworkHandler networkHandler = NetworkHandler();
    print("hello");
    var result = await networkHandler.post2("/profile/add", data);

    print(result.statusCode);

    expect(result.statusCode, 200);
  });
}
