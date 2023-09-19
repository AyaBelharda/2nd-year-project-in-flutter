import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailCred extends StatefulWidget {
  final String hint;
  final bool obscureText;
  final TextEditingController controller;
  const  EmailCred({
    super.key,
    required this.hint,
    required this.controller,
    required this.obscureText,
  });

  @override
  _EmailCredState createState() => _EmailCredState();
}

class _EmailCredState extends State<EmailCred> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0),
      child: SizedBox(
        width: 0.32*MediaQuery.of(context).size.width,
        height: 0.18*MediaQuery.of(context).size.height,
        child: TextFormField(
          autocorrect: true,
          validator: (value) => value != null && !EmailValidator.validate(value)
              ? 'This is not a valid email'
              : null,
          keyboardType: TextInputType.emailAddress,
          maxLength: 50,
          controller: widget.controller,
          obscureText: widget.obscureText,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.email,
              color: Colors.black,
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: widget.hint,
            hintStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'Digital',
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.blueGrey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.black87,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PassCred extends StatelessWidget {
  final controller;
  final String hint;
  final bool obscureText;

  const PassCred({
    super.key,
    required this.controller,
    required this.hint,
    required this.obscureText,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0),
      child: SizedBox(
        width: 0.32*MediaQuery.of(context).size.width,
        height: 0.18*MediaQuery.of(context).size.height,
        child: TextFormField(
          validator: (value) => value == null || value.length < 3 ? 'Enter 10+ char password' : null ,
          maxLength: 50,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.key,
                color: Colors.black,
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: hint,
              hintStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 12,fontFamily: 'Digital'),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.blueGrey)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.black87, width: 2))),
        ),
      ),
    );
  }
}

class UserCred extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  const UserCred({
    super.key,
    required this.controller,
    required this.hint,
    required this.obscureText,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: TextFormField(
        validator: (value) => value == null || value.length < 10 ? 'Enter 10+ char password' : null ,
        maxLength: 50,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hint,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.orange)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white, width: 10))),
      ),
    );
  }
}
