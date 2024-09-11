import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Anime extends StatefulWidget {
  const Anime({super.key});
  @override
  State<Anime> createState() => _AnimeState();
}

class _AnimeState extends State<Anime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: Lottie.network('https://lottie.host/c2309a12-5c59-4fa0-9845-ee693764784d/RXdameyrwf.json')),
      ),   );
  }
}