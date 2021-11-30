import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gojek/common/my_colors.dart';
import 'package:gojek/ui/screen/beranda.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gojek',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        //primarySwatch: MyColors.darkGreen,
      ),
      home: const Beranda(),
    );
  }
}
