import 'package:flutter/material.dart';
import 'package:focusfeed/features/screens/feed_item.dart';

class FeedScreen extends StatelessWidget {
  final List<FeedItem> items;
  final VoidCallback onUpdate;

  const FeedScreen({super.key, required this.items, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F2A),
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return FeedPostCard(item: item, onChanged: onUpdate);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "FocusFeed",
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
                    child: const Icon(Icons.search, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedPostCard extends StatefulWidget {
  final FeedItem item;
  final VoidCallback onChanged;

  const FeedPostCard({super.key, required this.item, required this.onChanged});

  @override
  State<FeedPostCard> createState() => _FeedPostCardState();
}

class _FeedPostCardState extends State<FeedPostCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 14,
          bottom: 155,
          child: Column(
            children: [
              _RightSideActionButton(
                icon: widget.item.learned
                    ? Icons.check_circle
                    : Icons.school_outlined,
                label: widget.item.learned ? "Learned" : "Studying",
                iconColor: widget.item.learned
                    ? Colors.greenAccent
                    : Colors.white,
                onTap: () {
                  setState(() {
                    widget.item.learned = !widget.item.learned;
                  });
                  widget.onChanged();
                },
              ),
              const SizedBox(height: 18),
              _RightSideActionButton(
                icon: widget.item.bookmarked
                    ? Icons.bookmark
                    : Icons.bookmark_border,
                label: "Save",
                iconColor: widget.item.bookmarked
                    ? const Color.fromRGBO(133, 90, 251, 1)
                    : Colors.white,
                onTap: () {
                  setState(() {
                    widget.item.bookmarked = !widget.item.bookmarked;
                  });
                  widget.onChanged();
                },
              ),
            ],
          ),
        ),
        Positioned(
          left: 16,
          right: 90,
          bottom: 28,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: widget.item.categoryBg,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  widget.item.category,
                  style: TextStyle(
                    color: widget.item.categoryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.item.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.item.description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RightSideActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final VoidCallback onTap;

  const _RightSideActionButton({
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0x40000000),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white12),
            ),
            child: Icon(icon, color: iconColor, size: 26),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 64,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
