import 'package:board/core/constants/size.dart';
import 'package:flutter/material.dart';

class DropdownArrows extends StatelessWidget {
  final String imgPath;
  const DropdownArrows({super.key, required this.imgPath,});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imgPath,
      width: AppSizes.iconSizeM,
      height: AppSizes.iconSizeM,
    );
  }
}
