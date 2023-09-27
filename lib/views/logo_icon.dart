//import 'dart:js_interop';

import 'package:flutter/material.dart';

class LogoIcon extends StatelessWidget {
  const LogoIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipOval(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(
              'assets/logo.png',
            ),
          ),
        ),
      ),
    );
  }
}
