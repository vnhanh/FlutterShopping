

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class SAppLocalizations {
  static SAppLocalizations? of(BuildContext context) {
    return Localizations.of<SAppLocalizations>(context, SAppLocalizations);
  }

  String? getText(String key) => language[key];
}

late Map<String,dynamic> language;

class SAppLocalizationsDelegate extends LocalizationsDelegate<SAppLocalizations> {
  const SAppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['vn', 'en'].contains(locale.languageCode);

  @override
  Future<SAppLocalizations> load(Locale locale) async {
    String string = await rootBundle.loadString("assets/strings/${locale.languageCode}.json");
    language = jsonDecode(string);
    return SynchronousFuture<SAppLocalizations>(SAppLocalizations());
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<SAppLocalizations> old) => false;
}
