import 'package:flutter/material.dart';
import 'package:board/core/widgets/custom_app_bar.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  final bool? showBackButton;
  const DefaultLayout({
    this.backgroundColor,
    required this.child,
    this.title,
    this.bottomNavigationBar,
    this.showBackButton = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: CustomAppBar(title: title ?? '', showBackButton: showBackButton ?? true),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
