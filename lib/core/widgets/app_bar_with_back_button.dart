import 'package:flutter/material.dart';

class AppBarWithBackButton extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  const AppBarWithBackButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: Text(title, textAlign: TextAlign.center),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
