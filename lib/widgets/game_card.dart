import 'package:flutter/material.dart';
import '../config/theme.dart';

class GameCard extends StatefulWidget {
  final int index;
  const GameCard({super.key, required this.index});

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  bool _isHovering = false;
  final List<String> _gameTitles = [
    "Gates of Olympus", "Sweet Bonanza", "Sugar Rush", "Wanted Dead", "Zeus vs Hades",
    "Starlight Princess", "Fruit Party", "Big Bass Splash", "The Dog House", "Madame Destiny"
  ];

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.identity()..scale(_isHovering ? 1.05 : 1.0),
        decoration: BoxDecoration(
          color: CasinoTheme.cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: _isHovering 
            ? [const BoxShadow(color: Colors.black54, blurRadius: 20, offset: Offset(0, 10))]
            : [],
          image: const DecorationImage(
            image: NetworkImage("https://via.placeholder.com/200x250/222222/FFFFFF?text=GAME"),
            fit: BoxFit.cover,
            opacity: 0.8
          ),
        ),
        child: Stack(
          children: [
            if (_isHovering)
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: CasinoTheme.accentGreen,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.play_arrow, color: Colors.black, size: 30),
                  ),
                ),
              ),
            Positioned(
              bottom: 0, left: 0, right: 0,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  ),
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_gameTitles[widget.index % _gameTitles.length], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                    const SizedBox(height: 4),
                    const Text("Pragmatic Play", style: TextStyle(color: Colors.grey, fontSize: 10)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}