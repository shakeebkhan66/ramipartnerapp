import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'colors.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: SpinKitFadingCircle(
          color: singInWithGoogleButtonColor,
          duration:  Duration(milliseconds: 700),
          size: 60.0,
        ),
      ),
    );
  }
}