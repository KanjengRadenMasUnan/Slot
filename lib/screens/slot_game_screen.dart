import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../config/theme.dart';

class SlotGameScreen extends StatefulWidget {
  final String gameTitle;
  const SlotGameScreen({super.key, required this.gameTitle});

  @override
  State<SlotGameScreen> createState() => _SlotGameScreenState();
}

class _SlotGameScreenState extends State<SlotGameScreen> {
  // Simbol slot
  final List<String> symbols = ['🍎', '💎', '🔔', '7️⃣', '🍋', '🍒'];
  
  // State mesin
  List<int> reelIndices = [0, 0, 0];
  bool isSpinning = false;
  double balance = 1000.0;
  double lastWin = 0.0;
  final double betAmount = 10.0;

  void _spin() {
    if (balance < betAmount || isSpinning) return;

    setState(() {
      isSpinning = true;
      balance -= betAmount;
      lastWin = 0;
    });

    // Simulasi putaran dengan timer
    int counter = 0;
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        reelIndices = [
          Random().nextInt(symbols.length),
          Random().nextInt(symbols.length),
          Random().nextInt(symbols.length),
        ];
      });

      counter++;
      if (counter >= 20) { // Berhenti setelah 2 detik
        timer.cancel();
        _checkWinner();
      }
    });
  }

  void _checkWinner() {
    setState(() {
      isSpinning = false;
      // Logika menang: Jika 3 simbol sama
      if (reelIndices[0] == reelIndices[1] && reelIndices[1] == reelIndices[2]) {
        lastWin = betAmount * 10;
        balance += lastWin;
      } 
      // Logika menang: Jika 2 simbol sama
      else if (reelIndices[0] == reelIndices[1] || reelIndices[1] == reelIndices[2]) {
        lastWin = betAmount * 2;
        balance += lastWin;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F171E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.gameTitle),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "💰 Rp ${balance.toStringAsFixed(0)}",
                style: const TextStyle(color: CasinoTheme.accentGreen, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Jackpot Info
            if (lastWin > 0)
              Text("WIN: +Rp ${lastWin.toStringAsFixed(0)}", 
                style: const TextStyle(color: Colors.yellow, fontSize: 32, fontWeight: FontWeight.bold)),
            
            const SizedBox(height: 40),

            // Reel Machine
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CasinoTheme.cardColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: CasinoTheme.accentGreen, width: 3),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: reelIndices.map((index) => _buildReel(symbols[index])).toList(),
              ),
            ),

            const SizedBox(height: 50),

            // Spin Button
            GestureDetector(
              onTap: _spin,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSpinning ? Colors.grey : CasinoTheme.accentGreen,
                  boxShadow: [
                    BoxShadow(
                      color: CasinoTheme.accentGreen.withOpacity(0.5),
                      blurRadius: 20,
                      spreadRadius: 5
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    isSpinning ? "..." : "SPIN",
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text("BET: \$${betAmount.toStringAsFixed(2)}", style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildReel(String symbol) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 80,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(symbol, style: const TextStyle(fontSize: 50)),
      ),
    );
  }
}