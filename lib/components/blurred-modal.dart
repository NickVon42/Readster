import 'dart:ui';

import 'package:flutter/material.dart';

PageRouteBuilder buildBlurredModal(
    {Size size, Widget child, double height = 360, double width = 340}) {
  return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 2000),
      opaque: false,
      pageBuilder: (BuildContext context, __, ___) {
        return Scaffold(
          backgroundColor: Colors.black45,
          body: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: child,
              ),
            ),
          ),
        );
      });
}
