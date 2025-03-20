import 'package:board/core/constants/color.dart';
import 'package:board/core/constants/size.dart';
import 'package:board/core/constants/style.dart';
import 'package:flutter/material.dart';

class FloatingGradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const FloatingGradientButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.0,
      right: 0,
      left: 0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 60.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF9DCEFF),
                  Color(0xFF6499FF),
                  Color(0xFF3971FF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusXXL),
            ),
            child: Center(
              child: Text(
                title,
                style: AppTextStyle.button.copyWith(
                  color: AppColor.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
