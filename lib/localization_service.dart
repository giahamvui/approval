import 'dart:ui';

import 'package:get/get.dart';

import 'lang/en_us.dart';
import 'lang/ja_jp.dart';
import 'lang/vn_vn.dart';

class LocalizationService extends Translations {
  // Default locale
  static final locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('vn', 'VN');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'Tiếng việt',
    '日本語',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('en', 'US'),
    Locale('vn', 'VN'),
    Locale('ja', 'JP'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'vn_VN': vnVN,
        'ja_JP': jaJP,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
