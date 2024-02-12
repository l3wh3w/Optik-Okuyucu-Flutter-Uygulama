import 'package:flutter/material.dart';
import 'package:im_upload/view/pages/analysis/analysis.dart';
import 'package:im_upload/view/pages/answer_key.dart';
import 'package:im_upload/view/pages/yonlendirme_sayfasi.dart';

void main() {
  runApp(const MyApp()); // An empty toast just to initialize Fluttertoast
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
              foregroundColor: Colors.indigo[800],
              backgroundColor: Colors.grey[100], // Buton metin rengi
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Butonun kenar yuvarlaklığı
              ),
            )),
            bottomAppBarTheme: const BottomAppBarTheme(color: Color.fromARGB(255, 232, 236, 236)),
            appBarTheme: const AppBarTheme(
              color: Color(0xff00a896),
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
            )),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const YonlendirmeSayfasi(),
          '/analysis': (context) => const Analysis(),
          '/answer_key': (context) => const AnswerKey(),
          // '/optik_formlar': (context) => OptikFormlar(),
        });
  }
}
