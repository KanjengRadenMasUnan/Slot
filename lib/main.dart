import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'screens/lobby_screen.dart';

void main() {
  runApp(const MasterCasinoApp());
}

class MasterCasinoApp extends StatelessWidget {
  const MasterCasinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Imperium Casino',
      theme: CasinoTheme.darkTheme,
      home: const MainLayout(),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // A. SIDEBAR
          Container(
            width: 240,
            color: CasinoTheme.sidebarColor,
            child: Column(
              children: [
                Container(
                  height: 80,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 24),
                  child: Row(
                    children: const [
                      Icon(Icons.diamond, color: CasinoTheme.accentGreen, size: 28),
                      SizedBox(width: 10),
                      Text("IMPERIUM", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: 2, color: Colors.white)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    children: [
                      _sidebarItem(Icons.home_filled, "Lobby", true),
                      _sidebarItem(Icons.favorite, "Favourites", false),
                      _sidebarItem(Icons.casino, "Slots", false),
                      _sidebarItem(Icons.pie_chart, "Wheel", false),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // B. KONTEN UTAMA
          Expanded(
            child: Column(
              children: [
                // Header Atas (Search & Wallet)
                Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  color: CasinoTheme.bgDark,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 300,
                        height: 40,
                        decoration: BoxDecoration(color: CasinoTheme.cardColor, borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: const Icon(Icons.search, color: Colors.grey, size: 18),
                      ),
                      Row(
                        children: [
                          const Text("\$ 5,240.50", style: TextStyle(color: CasinoTheme.accentGreen, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(color: CasinoTheme.accentGreen, borderRadius: BorderRadius.circular(4)),
                            child: const Text("Wallet", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                
                // Panggil Halaman Lobby
                const Expanded(
                  child: LobbyScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sidebarItem(IconData icon, String label, bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: isActive ? CasinoTheme.cardColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: isActive ? CasinoTheme.accentGreen : Colors.grey, size: 20),
        title: Text(label, style: TextStyle(color: isActive ? Colors.white : Colors.grey, fontSize: 14)),
        onTap: () {},
      ),
    );
  }
}