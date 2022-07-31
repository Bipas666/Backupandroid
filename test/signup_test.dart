import 'package:blogapp/NetworkHandler.dart';

import 'package:blogapp/Pages/SinInPage.dart';

import 'package:blogapp/main.dart';

import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Wrong user name and password canot login', () async {
    // ignore: todo

    // TODO: Implement test

    Map<String, String> data = {
                      "username": 'Gopal',
                      "email": 'Gopal@email.com',
                      "password": '12345678',
                    };

    NetworkHandler networkHandler = NetworkHandler();
    print("hello");
    var result = await networkHandler.post1("/user/register", data);

    print(result.statusCode);

    expect(result.statusCode, 200);
  });
}
