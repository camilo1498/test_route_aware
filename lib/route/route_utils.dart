import 'package:flutter/cupertino.dart';
import 'package:untitled_22/screen/first_page.dart';
import 'package:untitled_22/screen/second_page.dart';
import 'package:untitled_22/screen/third_page.dart';

import '../main.dart';

final appRoutes = {
  homeRoute: (_) => HomePage(),
  firstRoute: (_) => FirstPage(),
  secondRoute: (_) => SecondPage(),
  thirdRoute: (_) => ThirdPage(),
};

const String homeRoute = "/";
const String firstRoute = "/firstPage";
const String secondRoute = "/secondPage";
const String thirdRoute = "/thirdPage";

class ObserverRoute {
  static final RouteObserver<PageRoute<dynamic>> routeObserver =
      RouteObserver<PageRoute<dynamic>>();
}
