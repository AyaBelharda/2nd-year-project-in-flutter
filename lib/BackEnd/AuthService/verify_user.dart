import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sorttrash/BackEnd/PlayerProgress/player.dart';
import 'package:uuid/uuid.dart';
import '../../main.dart';



class VerifyUserEmail extends StatefulWidget {
  const VerifyUserEmail({Key? key}) : super(key: key);
  @override
  State<VerifyUserEmail> createState() => _VerifyUserEmailState();
}

class _VerifyUserEmailState extends State<VerifyUserEmail> {
  late User user;
  late Timer timer;
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser!;
    user.sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      verifyUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.greenAccent,
      ),
      child: const Center(
        child: Text(
          'Please Verify Your Email to proceed !',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Digital',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future verifyUser() async {
    Parent methodParent = Parent([], 0, const Uuid().v4().toString());
    try {
      User user = FirebaseAuth.instance.currentUser!;
      await user.reload();
      if (user.emailVerified) {
        timer.cancel();
        methodParent.createData(user.uid);
        await navigatorKey.currentState!.pushReplacementNamed('/ChildSelector');
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
