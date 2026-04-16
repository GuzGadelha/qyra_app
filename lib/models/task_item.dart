import 'package:flutter/material.dart';

/// Represents a daily task or action item in the application.
/// This is a pure data model used by the ViewModels to pass data to the Views.
class TaskItem {

  final String title;
  final String subtitle;
  final String imagePath;
  final String actionText;
  final Color backgroundColor;
  final Color actionTextColor;
  final VoidCallback onActionTap;


  /// Creates a new [TaskItem] instance.
  TaskItem({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.actionText,
    required this.backgroundColor,
    required this.actionTextColor,
    required this.onActionTap,
  });
}