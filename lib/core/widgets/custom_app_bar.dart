import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool? showBackButton;
  const CustomAppBar({super.key, required this.title, this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton == true ? IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back_ios),
      ) : null,
      title: Text(title, textAlign: TextAlign.center),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
