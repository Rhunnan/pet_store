import 'package:flutter/material.dart';
import 'package:pet_store/components/starting_page.dart';
import 'package:pet_store/components/store_class.dart';
import 'package:provider/provider.dart';

List<String> startData = [
  "assets/images/startCat.png",
  "assets/images/startCat2.png"
];

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => CartModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StartingPage(title: 'PetShop'),
    );
  }
}
