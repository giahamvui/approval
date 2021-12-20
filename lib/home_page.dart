import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'localization_service.dart';
import 'package:approval_online/theme/theme_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedLang = LocalizationService.langs.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('hello'.tr),
            SizedBox(height: 20),
            Row(
              children: [
                DropdownButton(
                  icon: Icon(Icons.arrow_drop_down),
                  value: _selectedLang,
                  items: LocalizationService.langs.map((String lang) {
                    return DropdownMenuItem(value: lang, child: Text(lang));
                  }).toList(),
                  onChanged: (String value) {
                    // updates dropdown selected value
                    setState(() => _selectedLang = value);
                    // gets language and changes the locale
                    LocalizationService().changeLocale(value);
                  },
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  color: context.theme.buttonColor,
                  child: Text(
                    'changetheme'.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: ThemeService().switchTheme,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}