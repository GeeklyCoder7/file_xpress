import 'package:file_xpress/app/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

//Reusable loading widget used throughout the app
//Provides consistent loading indicators with optional text
class LoadingWidget extends StatelessWidget {
  final String? message;
  final bool showMessage;
  final Color? color;
  final double size;

  const LoadingWidget({
    super.key,
    this.message,
    this.showMessage = true,
    this.color,
    this.size = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          //loading indicator
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                color ?? AppColors.primaryBlue,
              ),
              strokeWidth: 3,
            ),
          ),

          //optional loading message
          if (showMessage) ...[
            const SizedBox(height: AppConstant.padding,),

            Text(
              message ?? 'Loading...',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.darkGray,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

//Specialized loading widget for file operations
class FileLoadingWidget extends StatelessWidget {
  final String fileName;
  final double? progress;

  const FileLoadingWidget({super.key, required this.fileName, this.progress,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          //File icon
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppConstant.borderRadius),
            ),
            child: const Icon(
              Icons.insert_drive_file,
              size: 32,
              color: AppColors.primaryBlue,
            ),
          ),

          const SizedBox(height: AppConstant.padding,),

          //Progress indicator or circular progress
          if (progress != null) ... [
            LinearProgressIndicator(
              value: progress! / 100,
              backgroundColor: AppColors.lightGray,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.successGreen),
            ),

            const SizedBox(height: AppConstant.smallPadding,),

            Text(
              '${progress!.toStringAsFixed(1)}%',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.successGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
          ] else ...[
            const SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
                strokeWidth: 3,
              ),
            ),
          ],

          const SizedBox(height: AppConstant.padding,),

          //File name
          Text(
            fileName,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.almostBlack,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

