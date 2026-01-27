import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../widgets/promo_carousel.dart';
import '../widgets/game_card.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CasinoTheme.background,
      // AppBar Khusus
      appBar: AppBar(
        backgroundColor: CasinoTheme.cardColor,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.casino, color: CasinoTheme.primaryGold),
            SizedBox(width: 8),
            Text(
              "IMPERIUM",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          // Widget Saldo
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: CasinoTheme.primaryGold),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.account_balance_wallet,
                  size: 16,
                  color: CasinoTheme.primaryGold,
                ),
                SizedBox(width: 8),
                Text(
                  "IDR 500.000",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.add_circle,
                  size: 18,
                  color: CasinoTheme.accentGreen,
                ), // Tombol Deposit
              ],
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Carousel Banner (Pastikan widget ini punya aspect ratio yg bagus)
            const PromoCarousel(),

            // 2. Ticker Bar (Winning Log)
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: CasinoTheme.cardColor,
                border: Border(bottom: BorderSide(color: Colors.white10)),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _tickerItem(Icons.trending_up, "JACKPOT: IDR 42,000,000"),
                  _tickerItem(Icons.star, "Budi88 menang IDR 500k"),
                  _tickerItem(Icons.flash_on, "Gacor99 menang IDR 2.2jt"),
                  _tickerItem(Icons.star, "SultanX menang IDR 12jt"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 3. Grid Games
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.local_fire_department,
                            color: Colors.orange,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Permainan Populer",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Lihat Semua >",
                        style: TextStyle(
                          color: CasinoTheme.primaryGold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // Responsive Grid
                  LayoutBuilder(
                    builder: (context, constraints) {
                      int crossCount = constraints.maxWidth > 800
                          ? 6
                          : 3; // Lebih banyak kolom di web lebar
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 12, // Tampilkan 12 game
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossCount,
                          childAspectRatio:
                              0.7, // Rasio kartu game (lebih tinggi)
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        // Pastikan GameCard menerima index/data
                        itemBuilder: (context, index) => GameCard(index: index),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // 4. Footer
            _buildFooter(),
          ],
        ),
      ),

      // Floating Bottom Navigation (Opsional, agar mirip App Native)
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CasinoTheme.cardColor,
        selectedItemColor: CasinoTheme.primaryGold,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Dompet'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }

  Widget _tickerItem(IconData icon, String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Icon(icon, size: 14, color: CasinoTheme.accentGreen),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      color: Colors.black, // Footer hitam pekat
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      width: double.infinity,
      child: Column(
        children: [
          Icon(Icons.shield, color: Colors.grey, size: 30),
          SizedBox(height: 10),
          const Text(
            "IMPERIUM CASINO",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white54,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Platform game terpercaya dengan sistem keamanan tingkat tinggi.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 11),
          ),
          const SizedBox(height: 20),
          const Text(
            "© 2026 Imperium. All Rights Reserved.",
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
