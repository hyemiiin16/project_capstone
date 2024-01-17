import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_capstone/home.dart';
import 'package:project_capstone/landing.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_capstone/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      onGenerateRoute:  (RouteSettings routeSettings) {
        switch (routeSettings.name) {
          case LoginView.routeName:
            return PageTransition(
              child: const LoginView(),
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 800),
              curve: Curves.ease,
              settings: routeSettings,
            );
          case HomeView.routeName:
            return PageTransition(
              child: const HomeView(),
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 800),
              curve: Curves.ease,
              settings: routeSettings,
            );
          case LandingView.routeName:
          default:
            return PageTransition(
              child: const LandingView(),
              type: PageTransitionType.fade,
              curve: Curves.ease,
              settings: routeSettings,
              duration: const Duration(milliseconds: 400),
            );
        }
      }
    );
  }
}
