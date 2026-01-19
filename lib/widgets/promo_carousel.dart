import 'dart:async';
import 'package:flutter/material.dart';
import '../config/theme.dart'; // Pastikan import theme benar

class PromoCarousel extends StatefulWidget {
  const PromoCarousel({super.key});

  @override
  State<PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  final List<Map<String, dynamic>> banners = [
    {
      "title": "WEEKLY RAFFLE",
      "subtitle": "\$75,000 Prize Pool",
      "colors": [const Color(0xFF4A00E0), const Color(0xFF8E2DE2)],
      "button": "JOIN NOW"
    },
    {
      "title": "CASINO LEVEL UP",
      "subtitle": "Get 200% Bonus Deposit",
      "colors": [const Color(0xFFF12711), const Color(0xFFF5AF19)],
      "button": "DEPOSIT"
    },
    {
      "title": "VIP CLUB ACCESS",
      "subtitle": "Unlock Rakeback & Bonuses",
      "colors": [const Color(0xFF000000), const Color(0xFF434343)],
      "button": "VIEW STATUS"
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage < banners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastOutSlowIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (val) => setState(() => _currentPage = val),
            itemCount: banners.length,
            itemBuilder: (context, index) => _buildBannerItem(banners[index]),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(banners.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.white : Colors.white24,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBannerItem(Map<String, dynamic> data) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: data['colors'],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -50, top: -50,
            child: Icon(Icons.casino, size: 350, color: Colors.white.withOpacity(0.05)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(4)),
                  child: const Text("LIMITED OFFER", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 15),
                Text(data['title'], style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.white)),
                Text(data['subtitle'], style: const TextStyle(fontSize: 20, color: Colors.white70)),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CasinoTheme.accentGreen,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                  ),
                  child: Text(data['button'], style: const TextStyle(fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}