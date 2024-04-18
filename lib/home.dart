import 'package:flutter/material.dart';
import 'package:google_signinn/screens/youtube/feed.dart';
import 'package:google_signinn/screens/youtube_iframe/ifeed.dart';

class home1 extends StatelessWidget {
  const home1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Feed()));
                  },
                  child: const Text("Youtube player")),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  },
                  child: const Text("Youtube iframe")),
            ],
          ),
        ),
      ),
    );
  }
}
