import 'package:flutter/material.dart';
import 'package:shopping_ui/ui/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HyperHire Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
        fontFamily: 'NotoSansKR',
      ),
      home: const HomePage(),
    );
  }
}
