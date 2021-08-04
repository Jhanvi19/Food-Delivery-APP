import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/screens/login_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIOverlays(
  //     [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
      ),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splash: "assets/images/menus/ic_food_express.png",
          nextScreen: Login(),
          duration: 3000,
          splashTransition: SplashTransition.rotationTransition,
          pageTransitionType: PageTransitionType.leftToRight,
          backgroundColor: Colors.white),
    );
    //   FutureBuilder(
    //   future: Init.instance.initialize(),
    //   builder: (context, AsyncSnapshot snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
    //     } else {
    //       return MaterialApp(
    //         debugShowCheckedModeBanner: false,
    //         title: 'Flutter Demo',
    //         theme: ThemeData(
    //           primarySwatch: Colors.blue,
    //         ),
    //         home: Login(),
    //       );
    //     }
    //   },
    // );
  }
}
//
// class Splash extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Image.asset("assets/images/menus/ic_food_express.png"),
//       ),
//     );
//   }
// }
//
// class Init {
//   Init._();
//
//   static final instance = Init._();
//
//   Future initialize() async {
//     await Future.delayed(Duration(seconds: 3));
//   }
// }
