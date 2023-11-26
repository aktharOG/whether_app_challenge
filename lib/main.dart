import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whether_app_challenge/provider/home_provider.dart';
import 'package:whether_app_challenge/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeProvider())],
      child: MaterialApp(
        title: "Whether APP",
        theme: ThemeData(fontFamily: "Roboto"),
        home: const HomeScreen(),
      ),
    );
  }
}
