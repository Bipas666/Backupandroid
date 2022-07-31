

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WearOsDashboard extends StatefulWidget {
  const WearOsDashboard({Key key}) : super(key: key);

  @override
  State<WearOsDashboard> createState() => _WearOsDashboardState();
}

class _WearOsDashboardState extends State<WearOsDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("Wear os dashboard"),);
  }
}