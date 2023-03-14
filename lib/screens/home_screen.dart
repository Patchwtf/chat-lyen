import 'package:chat_lyen/routes/routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;

    return Scaffold(
      body: Center(
        child: ListView.separated(
          itemCount: menuOptions.length + 1,
          separatorBuilder: (BuildContext context, int index) {
            return TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, menuOptions[index].route);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(menuOptions[index].name),
                    Icon(menuOptions[index].icon)
                  ],
                ));
          },
          itemBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
