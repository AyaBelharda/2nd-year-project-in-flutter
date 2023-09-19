import 'package:flutter/material.dart';


class RegisterLoggingButton extends StatefulWidget {
  RegisterLoggingButton({super.key, Key? keyWidget, required description, required href}) {
    _description =description;
    _href = href;
  }
  late final String _description;
  late final String _href;
  @override
  State<RegisterLoggingButton> createState() => _RegisterLoggingButton();
}

class _RegisterLoggingButton extends State<RegisterLoggingButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, widget._href);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text(
              ' Or ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'Digital'),
            ),
            Text(
              widget._description,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(62,206,254, 1),
                  fontFamily: 'Digital'),
            )
          ],
        ));
  }
}
