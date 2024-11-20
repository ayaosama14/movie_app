import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/featchers/home_fetcher/presentation/views/home_view.dart';


import '../../../../utils/text_container.dart';

class SettingView extends StatefulWidget {
  static String id = 'setting_View';

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  String selectedLanguage = 'English';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Accessing context.locale here is safe
    final currentLocale = context.locale;
    selectedLanguage = currentLocale.languageCode == 'en' ? 'English' : 'Arabic';
  }

  void _changeLanguage(String language) {
    if (language == 'English') {
      context.setLocale(const Locale('en', 'US'));
    } else if (language == 'Arabic') {
      context.setLocale(const Locale('ar', 'SA'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting'.tr(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, HomeView.id);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 100),
            textContainer(text: "language", context: context),
            const SizedBox(height: 50),
            RadioListTile<String>(
              activeColor: Colors.purple,
              title: Text("English", style: Theme.of(context).textTheme.bodyMedium),
              value: 'English',
              groupValue: selectedLanguage,
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                  _changeLanguage(value);
                });
              },
            ),
            RadioListTile<String>(
              activeColor: Colors.purple,
              title: Text('العربية', style: Theme.of(context).textTheme.bodyMedium),
              value: 'Arabic',
              groupValue: selectedLanguage,
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                  _changeLanguage(value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
