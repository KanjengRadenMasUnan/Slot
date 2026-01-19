import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../widgets/promo_carousel.dart';
import '../widgets/game_card.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // 1. Carousel Banner
          const PromoCarousel(),

          // 2. Ticker Bar
          Container(
            width: double.infinity,
            height: 40,
            color: CasinoTheme.cardColor,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _tickerItem(Icons.trending_up, "BTC: \$42,000"),
                _tickerItem(Icons.star, "User88 won \$500"),
                _tickerItem(Icons.flash_on, "ETH: \$2,200"),
                _tickerItem(Icons.star, "Sultan99 won \$1,200"),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // 3. Grid Games
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("🔥 Popular Slots", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text("View All >", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 20),
                
                LayoutBuilder(
                  builder: (context, constraints) {
                    int crossCount = constraints.maxWidth > 1000 ? 5 : 3;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossCount,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) => GameCard(index: index),
                    );
                  },
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 60),

          // 4. Footer
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _tickerItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(icon, size: 16, color: CasinoTheme.accentGreen),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      color: const Color(0xFF0B1219),
      padding: const EdgeInsets.all(50),
      width: double.infinity,
      child: Column(
        children: [
          const Text("IMPERIUM CASINO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
          const SizedBox(height: 10),
          const Text("The world's leading crypto casino.", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 30),
          const Text("© 2026 Imperium. All Rights Reserved.", style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}