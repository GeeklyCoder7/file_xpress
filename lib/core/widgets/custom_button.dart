import 'package:file_xpress/app/app_colors.dart';
import 'package:file_xpress/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Custom button widget with consistent styling
///Provides different button types used throughout the app
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final bool isOutlined;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.isOutlined = false,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (isLoading) {
      child = const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
        ),
      );
    } else if (icon != null) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: AppConstant.iconSize),
          const SizedBox(width: AppConstant.smallPadding),
          Text(text),
        ],
      );
    } else {
      child = Text(text);
    }

    return SizedBox(
      width: width,
      height: height ?? AppConstant.buttonHeight,
      child: isOutlined ? OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: textColor ?? AppColors.primaryBlue,
          side: BorderSide(
            color: backgroundColor ?? AppColors.primaryBlue,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstant.borderRadius),
          ),
        ),
        child: child,
      ) : ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryBlue,
          foregroundColor: textColor ?? AppColors.white,
          elevation: AppConstant.cardElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppConstant.borderRadius
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}

///Floating action button with consistent styling
class CustomFAB extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final String? tooltip;
  final Color? backgroundColor;
  
  const CustomFAB({
    super.key,
    this.onPressed,
    required this.icon,
    this.tooltip,
    this.backgroundColor,
});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      backgroundColor: backgroundColor ?? AppColors.accentOrange,
      foregroundColor: AppColors.white,
      elevation: 6,
      child: Icon(icon),
    ) ;
  }
}

