import 'package:flutter/material.dart';
import 'package:flutter_workshop/view/home/view_example.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 4, 43, 89)),
        useMaterial3: true,
      ),
      home: const HomeViewExample(),
    );
  }
}
