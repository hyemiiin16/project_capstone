import 'package:flutter/material.dart';
import 'package:project_capstone/home.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const routeName = '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 180,
                )
              )
            ),
            Container(
              width: 350,
              margin: const EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                border: Border.all(color: const Color(0xFF280099), width: 2),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                obscureText: false,
                focusNode: usernameFocus,
                textInputAction: TextInputAction.next,
                scrollPadding: EdgeInsets.zero,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.grey
                  ),
                ),
                controller: username,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.black
                ),
              )
            ),
            Container(
              width: 350,
              margin: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                border: Border.all(color: const Color(0xFF280099), width: 2),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                obscureText: false,
                focusNode: passwordFocus,
                textInputAction: TextInputAction.next,
                scrollPadding: EdgeInsets.zero,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.grey
                  ),
                ),
                controller: password,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.black
                ),
              )
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                backgroundColor: const Color(0xFF280099),
                minimumSize: const Size(350, 50)
              ),
              onPressed: () {
                Navigator.restorablePushNamed(context, HomeView.routeName);
              },
              child: const Text(
                'LOGIN',
                textAlign: TextAlign.center,
                style:  TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.white
                ),
              )
            )
          ],
        ),
      )
    );
  }
}