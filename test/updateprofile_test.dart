import 'package:blogapp/NetworkHandler.dart';
import 'package:blogapp/Pages/SinInPage.dart';
import 'package:blogapp/main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  test('Wrong user name and password canot login', () async {
    // TODO: Implement test.
    Map<String, String> data = {
                    "name": 'Sandesh Thapa',               
                    "profession": 'Worker ',
                    "DOB": '01/02/2000',
                    "titleline": 'Working',
                    "about": 'high',
                  };
    NetworkHandler networkHandler = NetworkHandler();
    print("hello");
    var result = await networkHandler.patch1("/profile/update", data);
    print(result.statusCode);
    expect(result.statusCode, 200);
  });
}
