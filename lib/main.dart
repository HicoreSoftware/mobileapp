import 'package:flutter/material.dart';
import 'package:mobileapp/ui/register_ui.dart';
import 'package:mobileapp/ui/sign_in_ui.dart';
import 'package:mobileapp/ui/device_lock_ui.dart';
import 'package:mobileapp/utils/constants.dart';
//import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Theft Lock App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/register',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/sign-in': (context) => SignInUI(),
        '/register': (context) => RegisterUI(),
        '/home': (context) => DeviceLockUI(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
   // _checkLoginStatus();
  }

  /*Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool(Constants.IS_LOGGED_IN_KEY) ?? false;

    // Simulate a splash screen with a delay before routing to the next screen
    await Future.delayed(Duration(seconds: 2));

    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/sign-in');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
