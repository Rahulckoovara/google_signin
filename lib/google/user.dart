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
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              icon: Icon(Icons.logout_outlined),
              label: Text('logout'))
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('PROFILE'),
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(user.photoUrl!),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Name: ${user.displayName}'),
              SizedBox(
                height: 30,
              ),
              Text('Email: ${user.email}'),
            ],
          ),
        ),
      ),
    );
  }
}
