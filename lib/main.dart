import 'package:file_xpress/app/app_colors.dart';
import 'package:file_xpress/core/utils/constants.dart';
import 'package:file_xpress/core/widgets/custom_button.dart';
import 'package:file_xpress/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

import 'core/widgets/app_error_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FileXpress',
      debugShowCheckedModeBanner: false,
      theme: AppColors.lightTheme,

      //Custom error widget for better error handling
      builder: (context, widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return AppErrorWidget(errorDetails: errorDetails);
        };
        return widget!;
      },
      home: _SplashScreen()
    );
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(
                  AppConstant.borderRadius * 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBlue.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(
                Icons.share,
                size: 64,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: AppConstant.largePadding,),
            Text(
              AppConstant.appName,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppConstant.smallPadding,),
            Text(
              'Building architecture...',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.darkGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
