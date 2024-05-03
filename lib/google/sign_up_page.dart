import 'package:flutter/material.dart';
import 'package:google_signinn/custom/custom_color.dart';
import 'package:google_signinn/custom/custom_strings.dart';
import 'package:google_signinn/google/api/google_api.dart';
import 'package:google_signinn/home.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future SignIn() async {
      final user = await GoogleSignInApi.login();
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(CustomStrings.signInFailed)));
      }
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => home1(user: user!)));
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: CustomColor.greyColor,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  CustomStrings.welcomeLabel,
                  style: TextStyle(
                      color: CustomColor.primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  CustomStrings.loginLabel,
                  style:  TextStyle(
                      color: CustomColor.primaryColor, fontSize: 15),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: SignIn,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          child: Image.asset(
                            'assets/google.png',
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          CustomStrings.buttonLabel,
                          style: TextStyle(color: CustomColor.secondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
