


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(onPressed: () { FirebaseAuth.instance.signOut(); Navigator.popAndPushNamed(context, '/StartPage'); },
            child : const Text('Sign Out')),
      ],
    );
  }
}

