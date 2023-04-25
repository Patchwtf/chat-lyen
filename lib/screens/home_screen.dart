import 'package:chat_lyen/functions/functions.dart';
import 'package:chat_lyen/routes/routes.dart';
import 'package:chat_lyen/themes/themes.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;
    String themeID = "Color(0xffffffff)";
    String currentScaffoldColor =
        Theme.of(context).scaffoldBackgroundColor.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Principal"),
        actions: [
          IconButton(
              onPressed: () {
                Login credential = Login();
                credential.SignOut(context: context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 50),
            child: currentScaffoldColor == themeID
                ? const Image(
                    image: AssetImage("assets/lyen-logo.png"), height: 100)
                : const Image(
                    image: AssetImage("assets/lyen-logo-dark.png"),
                    height: 100),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                itemCount: menuOptions.length + 1,
                separatorBuilder: (BuildContext context, int index) {
                  return TextButton(
                      onPressed: () {
                        menuOptions[index].name == 'Chat'
                            ? Messages.messagesHist.clear()
                            : null;
                        Navigator.pushNamed(context, menuOptions[index].route);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(menuOptions[index].name,
                              style: currentScaffoldColor == themeID
                                  ? homeScreenItemsLigth
                                  : homeScreenItemsDark),
                          Icon(
                            menuOptions[index].icon,
                            color: Theme.of(context).iconTheme.color,
                          )
                        ],
                      ));
                },
                itemBuilder: (BuildContext context, int index) {
                  return Divider(
                      color: currentScaffoldColor == themeID
                          ? Colors.grey
                          : Colors.white70);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
