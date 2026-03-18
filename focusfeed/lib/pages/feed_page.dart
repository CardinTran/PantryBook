import 'package:flutter/material.dart';

// Data model for a feed item
enum CardType { flashcard, quiz, fill, learn }

class FeedItem {
  final CardType type;
  final String question;
  final String answer;
  final List<String>? choices; // for quiz
  final int? correctIndex;     // for quiz

  const FeedItem({
    required this.type,
    required this.question,
    required this.answer,
    this.choices,
    this.correctIndex,
  });
}

// Sample data
final List<FeedItem> sampleFeed = [
  FeedItem(
    type: CardType.flashcard,
    question: "What is the powerhouse of the cell?",
    answer: "The Mitochondria",
  ),
  FeedItem(
    type: CardType.quiz,
    question: "What planet is closest to the sun?",
    answer: "Mercury",
    choices: ["Venus", "Mercury", "Earth", "Mars"],
    correctIndex: 1,
  ),
  FeedItem(
    type: CardType.flashcard,
    question: "What does CPU stand for?",
    answer: "Central Processing Unit",
  ),
  FeedItem(
    type: CardType.quiz,
    question: "Which element has the symbol 'O'?",
    answer: "Oxygen",
    choices: ["Gold", "Osmium", "Oxygen", "Oganesson"],
    correctIndex: 2,
  ),
  FeedItem(
    type: CardType.flashcard,
    question: "Who wrote Romeo and Juliet?",
    answer: "William Shakespeare",
  ),
];

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF06080F),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome,", style: TextStyle(color: Colors.white54, fontSize: 15)),
                  Text("Austin", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // Scrollable feed
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: sampleFeed.length,
                itemBuilder: (context, index) {
                  final item = sampleFeed[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: _buildCard(item),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _BottomNav(),
    );
  }

  Widget _buildCard(FeedItem item) {
    switch (item.type) {
      case CardType.flashcard:
        return _FlashCard(item: item);
      case CardType.quiz:
        return _QuizCard(item: item);
      default:
        return _FlashCard(item: item);
    }
  }
}

// ── Flashcard ──────────────────────────────────────────────
class _FlashCard extends StatefulWidget {
  final FeedItem item;
  const _FlashCard({required this.item});

  @override
  State<_FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<_FlashCard> {
  bool _revealed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF13162E),
        borderRadius: BorderRadius.circular(20),
        border: Border(top: BorderSide(color: const Color.fromRGBO(133, 90, 251, 1), width: 3)),
      ),
      child: Column(
        children: [
          // Label row
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("FLASHCARD",
                    style: TextStyle(color: Color.fromRGBO(133, 90, 251, 1), fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1.2)),
                const Icon(Icons.credit_card, color: Color.fromRGBO(133, 90, 251, 1)),
              ],
            ),
          ),

          // Card content
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _revealed = !_revealed),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.item.question,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 32),
                      if (_revealed)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(133, 90, 251, 0.15),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color.fromRGBO(133, 90, 251, 0.4)),
                          ),
                          child: Text(
                            widget.item.answer,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )
                      else
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.refresh, color: Colors.white38, size: 18),
                            SizedBox(width: 6),
                            Text("Tap to reveal answer", style: TextStyle(color: Colors.white38, fontSize: 15)),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Prev / Next hints
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _NavButton(icon: Icons.chevron_left),
                _NavButton(icon: Icons.chevron_right),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Quiz Card ──────────────────────────────────────────────
class _QuizCard extends StatefulWidget {
  final FeedItem item;
  const _QuizCard({required this.item});

  @override
  State<_QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<_QuizCard> {
  int? _selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF13162E),
        borderRadius: BorderRadius.circular(20),
        border: Border(top: BorderSide(color: Colors.redAccent, width: 3)),
      ),
      child: Column(
        children: [
          // Label row
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("QUIZ",
                    style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1.2)),
                Icon(Icons.help_outline, color: Colors.redAccent),
              ],
            ),
          ),

          // Question + choices
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.item.question,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  ...List.generate(widget.item.choices!.length, (i) {
                    final isSelected = _selected == i;
                    final isCorrect = i == widget.item.correctIndex;
                    Color borderColor = Colors.white24;
                    Color bgColor = Colors.transparent;

                    if (_selected != null) {
                      if (isCorrect) {
                        borderColor = Colors.greenAccent;
                        bgColor = Colors.greenAccent.withOpacity(0.1);
                      } else if (isSelected) {
                        borderColor = Colors.redAccent;
                        bgColor = Colors.redAccent.withOpacity(0.1);
                      }
                    }

                    return GestureDetector(
                      onTap: _selected == null ? () => setState(() => _selected = i) : null,
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: borderColor),
                        ),
                        child: Text(
                          widget.item.choices![i],
                          style: const TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _NavButton(icon: Icons.chevron_left),
                _NavButton(icon: Icons.chevron_right),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Shared nav button ──────────────────────────────────────
class _NavButton extends StatelessWidget {
  final IconData icon;
  const _NavButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Colors.white70),
    );
  }
}

// ── Bottom Nav ─────────────────────────────────────────────
class _BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0D1023),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _NavItem(icon: Icons.psychology_outlined, label: "Feed", active: true),
          _NavItem(icon: Icons.layers_outlined, label: "Decks"),
          _NavItem(icon: Icons.person_outline, label: "Profile"),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;

  const _NavItem({required this.icon, required this.label, this.active = false});

  @override
  Widget build(BuildContext context) {
    final color = active ? Colors.white : Colors.white38;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 26),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: color, fontSize: 11)),
      ],
    );
  }
}