import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_internacionalizacion/presentation/widgets/change_language_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.title),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showLanguageSelectionDialog(context),
              child: Text(AppLocalizations.of(context)!.changeLanguage),
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const ChangeLanguageDialog();
      },
    );
  }
}
