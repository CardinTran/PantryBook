import 'package:flutter/material.dart';

class FeedItem {
  final String title;
  final String description;
  final String category;
  final Color categoryColor;
  final Color categoryBg;
  bool learned;
  bool bookmarked;

  FeedItem({
    required this.title,
    required this.description,
    required this.category,
    required this.categoryColor,
    required this.categoryBg,
    this.learned = false,
    this.bookmarked = false,
  });
}