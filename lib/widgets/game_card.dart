import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../screens/slot_game_screen.dart'; // Pastikan import ini sesuai dengan lokasi file game screen Anda

class GameCard extends StatefulWidget {
  final int index;
  const GameCard({super.key, required this.index});

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  bool _isHovering = false;

  // Daftar judul game agar dinamis berdasarkan index
  final List<String> _gameTitles = [
    "Gates of Olympus", "Sweet Bonanza", "Sugar Rush", "Wanted Dead", "Zeus vs Hades",
    "Starlight Princess", "Fruit Party", "Big Bass Splash", "The Dog House", "Madame Destiny"
  ];

  @override
  Widget build(BuildContext context) {
    // Mengambil judul berdasarkan index
    final String currentGameTitle = _gameTitles[widget.index % _gameTitles.length];

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        // Menghubungkan kartu ke SlotGameScreen saat diklik
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SlotGameScreen(gameTitle: currentGameTitle),
            ),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.identity()..scale(_isHovering ? 1.05 : 1.0),
          decoration: BoxDecoration(
            color: CasinoTheme.cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: _isHovering 
              ? [BoxShadow(color: CasinoTheme.accentGreen.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))]
              : [],
            image: const DecorationImage(
              // Placeholder image - ganti dengan asset asli jika sudah ada
              image: NetworkImage("https://via.placeholder.com/200x250/222222/FFFFFF?text=SLOT+GAME"),
              fit: BoxFit.cover,
              opacity: 0.8
            ),
          ),
          child: Stack(
            children: [
              // Overlay saat hover (efek gelap dan tombol play)
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
              
              // Label Judul Game di bagian bawah
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        currentGameTitle, 
                        style: const TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 13, 
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis
                        )
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Pragmatic Play", 
                        style: TextStyle(color: Colors.grey, fontSize: 10)
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}