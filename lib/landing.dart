import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_capstone/login.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  static const routeName = '/landing';

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  bool _visible = false;
  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      if (!_visible){
        setState(() {
          _visible = true;
        });
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            // opacity: 1,
            duration: const Duration(seconds: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 250,
                    )
                  )
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    'SMART ENERGY METERING APP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      color: Color(0xFF280099),
                      letterSpacing: 5
                    )
                  ),
                )
              ],
            ),
            onEnd: () {
              // if (_visible) {
              //   setState(() {
              //     _visible = false;
              //   });
              // }
              // else {
                Navigator.pushReplacementNamed(context, LoginView.routeName);
              // }
            },
          )
        )
      )
    );
  }
}