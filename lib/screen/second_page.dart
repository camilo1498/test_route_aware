import 'package:flutter/material.dart';
import 'package:untitled_22/route/navigation.dart';
import 'package:untitled_22/route/route_utils.dart';
import 'package:untitled_22/screen/routeWidget.dart';

class SecondPage extends StatefulWidget {
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Routewidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                child: Text('Home Page'),
                onPressed: () {
                  appNavigator.pushNamed(context, page: homeRoute);
                },
              ),
              SizedBox(height: 32),
              MaterialButton(
                child: Text('First Page'),
                onPressed: () {
                  appNavigator.pushNamed(context, page: firstRoute);
                },
              ),
              SizedBox(height: 32),
              MaterialButton(
                child: Text('Third Page'),
                onPressed: () {
                  appNavigator.pushNamed(context, page: thirdRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
