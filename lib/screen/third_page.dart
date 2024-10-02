import 'package:flutter/material.dart';
import 'package:untitled_22/route/route_utils.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
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
              child: Text('First Page'),
              onPressed: () {
                Navigator.pushNamed(context, firstRoute);
              },
            ),
            SizedBox(height: 32),
            MaterialButton(
              child: Text('Second Page'),
              onPressed: () {
                Navigator.pushNamed(context, secondRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
