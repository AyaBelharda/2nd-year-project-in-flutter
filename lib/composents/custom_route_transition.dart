import 'package:flutter/cupertino.dart';

class CustomPageTransition extends PageRouteBuilder {
  final Widget child;
  CustomPageTransition(this.child)
      : super(
      transitionDuration: const Duration(seconds: 1),
      pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      ScaleTransition(
        scale: animation,
        child: child,
      );
}
