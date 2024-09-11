import 'package:flutter/material.dart';
import 'package:google_signinn/anime.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(const Gpay());


class Gpay extends StatefulWidget {
  const Gpay({super.key});

  @override
  State<Gpay> createState() => _GpayState();
}

class _GpayState extends State<Gpay> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Anime(),
    );
  }
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            // Load a Lottie file from your assets
            Lottie.asset('assets/LottieLogo1.json'),

            // Load a Lottie file from a remote url
            Lottie.network(
                'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),

            // Load an animation and its images from a zip file
            Lottie.asset('assets/lottiefiles/angel.zip'),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:google_signinn/google/sign_up_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(),
//       home: SignUpPage(),
//     );
//   }
// }
