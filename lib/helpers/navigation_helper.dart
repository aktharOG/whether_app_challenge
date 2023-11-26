import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

push(BuildContext context, page) {
  Navigator.push(
    context,
   _createRoute(page)
  );
}

pushAndReplace(BuildContext context, page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => page,
    ),
  );
}

pushAndRemoveUntil(BuildContext context, page) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (_) => page,
    ),
    (_) => false,
  );
}

pushNamedAndRemoveUntil(BuildContext context, page) {
  Navigator.pushNamedAndRemoveUntil(context, page, (route) => false);
}


Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

//!

showSnackBar(BuildContext context, String message,
    {Color? color, Duration? duration, double margin = 10,SnackBarAction? action}) {
       ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    action: action,
    margin: EdgeInsets.only(bottom: margin),
    elevation: 5.0,
    behavior: SnackBarBehavior.floating,
    duration: duration ?? const Duration(seconds: 1),
    content: Text(message),
    backgroundColor: color ?? Colors.blue,
  ));
}
