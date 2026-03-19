import 'package:flutter/material.dart';
import 'package:focusfeed/features/screens/feed_item.dart';
import 'package:focusfeed/features/screens/feed_screen.dart';

class SavedScreen extends StatelessWidget {
  final List<FeedItem> items;
  final VoidCallback onUpdate;

  const SavedScreen({super.key, required this.items, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    final savedItems = items.where((item) => item.bookmarked).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0B0F2A),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Saved",
                    style: TextStyle(
                      color: Color.fromRGBO(133, 90, 251, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.bookmark, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: savedItems.isEmpty
                  ? const Center(
                      child: Text(
                        "No saved content yet.",
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                    )
                  : PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: savedItems.length,
                      itemBuilder: (context, index) {
                        return FeedPostCard(
                          item: savedItems[index],
                          onChanged: onUpdate,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
