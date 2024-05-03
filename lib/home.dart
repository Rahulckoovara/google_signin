import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_signinn/custom/custom_strings.dart';
import 'package:google_signinn/google/api/google_api.dart';
import 'package:google_signinn/google/sign_up_page.dart';
import 'package:google_signinn/screens/youtube/feed.dart';
import 'package:google_signinn/screens/youtube_iframe/ifeed.dart';

class home1 extends StatelessWidget {
  final GoogleSignInAccount user;

  const home1({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: 15, backgroundImage: NetworkImage(user.photoUrl!)),
                const SizedBox(width: 10),
                TextButton.icon(
                    onPressed: () async {
                      await GoogleSignInApi.logout();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                    },
                    icon: const Icon(Icons.logout_outlined),
                    label: const Text(CustomStrings.logoutTitle)),
              ],
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [

              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Feed()));
                  },
                  child: const Text(CustomStrings.youtubeLabel)),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  },
                  child: const Text(CustomStrings.youtubeiframeLabel)),
            ],
          ),
        ),
      ),
    );
  }
}
