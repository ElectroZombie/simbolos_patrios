import 'package:flutter/material.dart';

import '../utils/enum_types.dart';

class LanguageProvider extends ChangeNotifier {
  LanguageEnum language = LanguageEnum.en;

  changeLanguage() {
    if (language == LanguageEnum.en) {
      language = LanguageEnum.es;
    } else {
      language = LanguageEnum.en;
    }
    notifyListeners();
  }

  setValues() async {
    notifyListeners();
  }
}
