import 'package:flutter/material.dart';
import 'package:untitled_22/route/navigation.dart';
import 'package:untitled_22/route/route_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: appRoutes,
      navigatorObservers: [
        ObserverRoute.routeObserver, /*middleware*/
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Naigation Middleware'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              child: Text('Secound Page'),
              onPressed: () {
                appNavigator.pushNamed(context, page: secondRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
