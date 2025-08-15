import 'package:file_xpress/app/app_colors.dart';
import 'package:file_xpress/core/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//Reusable error widget displayed when app errors occur
class AppErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  const AppErrorWidget({super.key, required this.errorDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        title: const Text('Something went wrong'),
        backgroundColor: AppColors.errorRed,
        foregroundColor: AppColors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstant.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Error icon
            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.errorRed.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(
                    AppConstant.borderRadius * 2,
                  ),
                ),
                child: const Icon(
                  Icons.error_outline,
                  size: 48,
                  color: AppColors.errorRed,
                ),
              ),
            ),

            const SizedBox(height: AppConstant.largePadding),

            //Error title
            Center(
              child: Text(
                'Oops! An unexpected error occurred.',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.almostBlack,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: AppConstant.smallPadding),

            //Error description
            Center(
              child: Text(
                'Please restart the app and try again',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.darkGray),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: AppConstant.largePadding),

            //Restart button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  //In a real app, we might restart the app or navigate to home
                  Navigator.of(
                    context,
                  ).pushNamedAndRemoveUntil('/', (route) => false);
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Restart App'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppConstant.padding,
                  ),
                ),
              ),
            ),

            const SizedBox(height: AppConstant.padding),

            //Show error details in debug mode onlhy
            if (kDebugMode) ...[
              const Divider(),
              const SizedBox(height: AppConstant.padding),

              Text(
                'Error Details (Debug Mode): ',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.almostBlack,
                ),
              ),

              const SizedBox(height: AppConstant.smallPadding),

              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppConstant.padding),
                  decoration: BoxDecoration(
                    color: AppColors.almostBlack,
                    borderRadius: BorderRadius.circular(
                      AppConstant.borderRadius,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      errorDetails.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'monospace',
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
