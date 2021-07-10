import 'package:flutter/material.dart';
import 'package:untitled/Widgets/Drawer.dart';
import 'Screens/Cart_Screen.dart';
import 'Screens/Home_page.dart';
import 'Screens/LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          centerTitle: true,
          titleSpacing: 2.2,
          textTheme: Theme.of(context).textTheme,
          elevation: 10,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      routes: {
        "/" : (context)=> LoginPage(),
        "/home": (context)=> Home_page(),
        "/cart":(context)=>Cart(),
      },
      debugShowCheckedModeBanner: false,
    );

  }
}

