import 'package:flutter/material.dart';

// String baseUrl = "http://sorgu.parpek.com";
// String baseUrl2 = "http://192.168.1.188:8080";

abstract class BaseStatefulWidget<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);

  double dynamicHeight(double value) => MediaQuery.of(context).size.height * value / 100;
  double dynamicWidth(double value) => MediaQuery.of(context).size.width * value / 100;
}

mixin BaseStatelessWidget on StatelessWidget {
  double dynamicHeight(BuildContext context, double value) => MediaQuery.of(context).size.height * value / 100;
  double dynamicWidth(BuildContext context, double value) => MediaQuery.of(context).size.width * value / 100;
}
