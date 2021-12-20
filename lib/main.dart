import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';
import 'localization_service.dart';

import 'package:get_storage/get_storage.dart';
import 'package:approval_online/theme/theme.dart';
import 'package:approval_online/theme/theme_service.dart';

//void main() => runApp(MyApp());

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
    );
  }
}
