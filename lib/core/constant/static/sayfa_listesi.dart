import 'package:flutter/material.dart';
import 'package:im_upload/view/pages/analysis/sayfa_1.dart';
import 'package:im_upload/view/pages/analysis/sayfa_2.dart';
import 'package:im_upload/view/pages/analysis/sayfa_3.dart';
import 'package:im_upload/view/pages/analysis/sayfa_4.dart';

class SayfaListesi {
  static int birinciSayfaIndex = SayfaListesi.stringSayfa.indexOf("BirinciSayfa");
  static int ikinciSayfaIndex = SayfaListesi.stringSayfa.indexOf("IkinciSayfa");
  static int ucuncuSayfaIndex = SayfaListesi.stringSayfa.indexOf("UcuncuSayfa");
  static int dorduncuSayfaIndex = SayfaListesi.stringSayfa.indexOf("DorduncuSayfa");

  static List<Widget> widgetSayfa = [
    const BirinciSayfa(),
    const IkinciSayfa(),
    const UcuncuSayfa(),
    const DorduncuSayfa(),
  ];

  static final List<String> stringSayfa = ["BirinciSayfa", "IkinciSayfa", "UcuncuSayfa", "DorduncuSayfa"];
}
