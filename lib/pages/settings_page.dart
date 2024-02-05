import 'package:bubble_tea_app/components/neu_box.dart';
import 'package:bubble_tea_app/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Text(
              "Настройки",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          MyNeuBox(
              title: "Тема",
              child: CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context).isDarkMode,
                  onChanged: (value) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  })),
          MyNeuBox(
              title: "Язык",
              child: Icon(
                Icons.language,
                size: 40,
                color: Theme.of(context).colorScheme.secondary,
              )),
          MyNeuBox(
              title: "Поделиться",
              child: Icon(
                Icons.share,
                size: 40,
                color: Theme.of(context).colorScheme.secondary,
              )),
          MyNeuBox(
              title: "Удалить Акаунт",
              child: Icon(
                Icons.no_accounts,
                size: 40,
                color: Theme.of(context).colorScheme.secondary,
              )),
        ],
      ),
    );
  }
}
