import 'package:board/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:board/core/widgets/custom_app_bar.dart';

class DefaultLayout extends StatelessWidget {
  final double paddingHorizontal;
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
    this.paddingHorizontal = 20.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColor.bgGrey,
      appBar: CustomAppBar(
        title: title ?? '',
        showBackButton: showBackButton ?? true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
        child: child,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
