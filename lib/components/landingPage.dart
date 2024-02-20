import 'package:flutter/material.dart';
import 'package:pet_store/components/navigation_bar.dart';

class landingPage extends StatefulWidget {
  const landingPage({super.key});

  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  @override
  Widget build(BuildContext context) {
    return NavBar();
  }
}
