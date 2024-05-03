import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_signinn/google/api/google_api.dart';
import 'package:google_signinn/google/sign_up_page.dart';

class UserDetails extends StatelessWidget {
  final GoogleSignInAccount user;
  UserDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
              onPressed: () async {
                await GoogleSignInApi.logout();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const SignUpPage()));
              },
              icon: const Icon(Icons.logout_outlined),
              label: const Text('logout'))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('PROFILE'),
            const SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(user.photoUrl!),
            ),
            const SizedBox(
              height: 30,
            ),
            Text('Name: ${user.displayName}'),
            const SizedBox(
              height: 30,
            ),
            Text('Email: ${user.email}'),
          ],
        ),
      ),
    );
  }
}
