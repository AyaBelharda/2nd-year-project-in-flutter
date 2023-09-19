import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sorttrash/BackEnd/AuthService/auth_service.dart';
import 'package:sorttrash/StartPage/LoginPage/Cred/login_cred.dart';
import 'package:sorttrash/StartPage/LoginPage/Cred/login_resgister_buttons.dart';
import 'package:sorttrash/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = AuthService();
  final _mykey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  final User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    if (user != null) {
      if (!user!.emailVerified) {
        setState(() {
          user!.delete();
          FirebaseAuth.instance.signOut();
        });
      }
      super.initState();
    }
  }

  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg-image.png'),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height - 30,
                      color: Colors.transparent,
                    ),
                    Center(
                      child: Container(
                          height: 0.76 * MediaQuery.of(context).size.height,
                          width: 0.4 * MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white54,
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset:
                                      Offset(0, 8), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Form(
                              key: _mykey,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height:
                                        0.09 * MediaQuery.of(context).size.height,
                                    width:
                                        0.3 * MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color.fromRGBO(103, 235, 0, 1),
                                        side: const BorderSide(
                                            width: 1, color: Colors.black38),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                      child: const Text(
                                        'Login Page',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'Digital',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.06*MediaQuery.of(context).size.height,
                                  ),
                                  EmailCred(
                                      hint: 'Enter Email !',
                                      controller: email,
                                      obscureText: false),
                                  PassCred(
                                      controller: password,
                                      hint: 'Enter Password!',
                                      obscureText: true),
                                  RegisterLoggingButton(
                                    description: 'Register Here !',
                                    href: '/RegisterPage',
                                  ),
                                  SizedBox(
                                    height: 0.02*MediaQuery.of(context).size.height,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      print(MediaQuery.of(context).size);
                                      _auth.error = false;
                                      if (_mykey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                duration: Duration(seconds: 3),
                                                backgroundColor:
                                                    Colors.greenAccent,
                                                content: Text(
                                                  '🌐 : Trying to Login ',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Digital',
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14),
                                                )));
                                        await _auth.logIn(email.text.trim(),
                                            password.text.trim());
                                        setState(() {
                                          if (_auth.error) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    duration: const Duration(
                                                        seconds: 6),
                                                    backgroundColor:
                                                        Colors.redAccent,
                                                    content: Text(
                                                      '📢 : ${_auth.errorMessage} ',
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Digital',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13),
                                                    )));
                                          }
                                        });
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.lightBlueAccent,
                                        padding: const EdgeInsets.only(
                                            left: 40,
                                            right: 40,
                                            top: 5,
                                            bottom: 8)),
                                    child: const Text(
                                      'Login !',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Digital',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    Positioned(
                        left: 0.66*MediaQuery.of(context).size.width,
                        child: const RoundButton(
                          myIcon: Icons.exit_to_app,
                          href: '/StartPage',
                          couleur: Color.fromRGBO(255, 210, 23, 5),
                          shadowColor: Color.fromRGBO(255, 210, 23, 5),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
