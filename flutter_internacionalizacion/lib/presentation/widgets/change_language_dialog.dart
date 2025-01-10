import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_internacionalizacion/presentation/blocs/language/language_bloc.dart';
import 'package:flutter_internacionalizacion/presentation/blocs/language/language_event.dart';

class ChangeLanguageDialog extends StatelessWidget {
  const ChangeLanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.changeLanguage),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('English'),
            onTap: () {
              context
                  .read<LanguageBloc>()
                  .add(ChangeLanguageEvent(const Locale('en')));
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Español'),
            onTap: () {
              context
                  .read<LanguageBloc>()
                  .add(ChangeLanguageEvent(const Locale('es')));
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Français'),
            onTap: () {
              context
                  .read<LanguageBloc>()
                  .add(ChangeLanguageEvent(const Locale('fr')));
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
