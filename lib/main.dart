import 'package:flutter/material.dart';
import 'package:pinkfox/Feature/screen1/presentation/views/screen1_view.dart';
import 'package:pinkfox/core/utils/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      title: 'PinkFox',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const Screen1View(),
    );
  }
}
