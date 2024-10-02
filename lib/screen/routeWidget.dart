import 'package:flutter/material.dart';
import 'package:untitled_22/route/route_utils.dart';

class Routewidget extends StatefulWidget {
  const Routewidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<Routewidget> createState() => _RoutewidgetState();
}

class _RoutewidgetState extends State<Routewidget> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ObserverRoute.routeObserver
        .subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void dispose() {
    ObserverRoute.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    final route = ModalRoute.of(context)?.settings.name;
    print('didPush route: $route');
    super.didPush();
  }

  @override
  void didPopNext() {
    final route = ModalRoute.of(context)?.settings.name;
    print('didPopNext route: $route');
    super.didPopNext();
  }

  @override
  void didPushNext() {
    final route = ModalRoute.of(context)?.settings.name;
    print('didPushNext route: $route');
    super.didPushNext();
  }

  @override
  void didPop() {
    final route = ModalRoute.of(context)?.settings.name;
    print('didPop route: $route');
    super.didPop();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
