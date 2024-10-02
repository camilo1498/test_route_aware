import 'package:flutter/material.dart';
import 'package:untitled_22/route/route_utils.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              child: Text('Home Page'),
              onPressed: () {
                Navigator.pushNamed(context, homeRoute);
              },
            ),
            SizedBox(height: 32),
            MaterialButton(
              child: Text('Second Page'),
              onPressed: () {
                Navigator.pushNamed(context, secondRoute);
              },
            ),
            SizedBox(height: 32),
            MaterialButton(
              child: Text('Third Page'),
              onPressed: () {
                Navigator.pushNamed(context, thirdRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
