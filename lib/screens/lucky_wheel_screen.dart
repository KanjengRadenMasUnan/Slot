import 'dart:math';
import 'package:flutter/material.dart';
import '../config/theme.dart';

class LuckyWheelScreen extends StatefulWidget {
  const LuckyWheelScreen({super.key});

  @override
  State<LuckyWheelScreen> createState() => _LuckyWheelScreenState();
}

class _LuckyWheelScreenState extends State<LuckyWheelScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  // Hadiah dalam roda
  final List<String> _rewards = [
    "FREE SPIN",
    "Rp 50rb",
    "ZONK",
    "Rp 1jt",
    "JACKPOT",
    "Rp 500rb",
    "RETRY",
    "Rp 10rb",
  ];

  bool _isSpinning = false;
  double _currentRotation = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // Durasi putaran
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
  }

  void _spinWheel() {
    if (_isSpinning) return;

    setState(() {
      _isSpinning = true;
    });

    // Menentukan target rotasi (minimal 5 putaran penuh + sudut acak)
    double randomStop = Random().nextDouble() * (2 * pi);
    double totalRotation = (10 * pi) + randomStop;

    _controller.reset();
    final Animation<double> sequence = Tween<double>(
      begin: _currentRotation,
      end: _currentRotation + totalRotation,
    ).animate(_animation);

    _controller.forward().then((_) {
      setState(() {
        _isSpinning = false;
        _currentRotation += totalRotation;

        // Kalkulasi pemenang berdasarkan sudut akhir
        int index =
            (((_currentRotation % (2 * pi)) / (2 * pi)) * _rewards.length)
                .floor();
        // Karena putaran searah jarum jam, kita balik index-nya
        int resultIndex = (_rewards.length - 1) - index;

        _showResult(_rewards[resultIndex]);
      });
    });
  }

  void _showResult(String reward) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: CasinoTheme.cardColor,
        title: const Text(
          "CONGRATULATIONS!",
          style: TextStyle(color: CasinoTheme.accentGreen),
        ),
        content: Text(
          "You won $reward!",
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "COLLECT",
              style: TextStyle(color: CasinoTheme.accentGreen),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F171E),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "LUCKY WHEEL",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 50),

            // Visual Roda
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    // Jika sedang berputar, gunakan nilai animasi, jika diam gunakan rotasi terakhir
                    double rotationValue = _isSpinning
                        ? (Tween<double>(
                            begin: _currentRotation,
                            end: _currentRotation + (10 * pi),
                          ).evaluate(_animation))
                        : _currentRotation;

                    return Transform.rotate(
                      angle: _isSpinning
                          ? (Tween<double>(
                              begin: _currentRotation,
                              end: _currentRotation + 10 * pi,
                            ).evaluate(_animation))
                          : _currentRotation,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: CasinoTheme.accentGreen,
                            width: 8,
                          ),
                          gradient: SweepGradient(
                            colors: [
                              Colors.red,
                              Colors.blue,
                              Colors.green,
                              Colors.yellow,
                              Colors.purple,
                              Colors.orange,
                              Colors.teal,
                              Colors.pink,
                            ],
                          ),
                        ),
                        child: Stack(
                          children: List.generate(_rewards.length, (index) {
                            return Transform.rotate(
                              angle: (2 * pi / _rewards.length) * index,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    _rewards[index],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    );
                  },
                ),
                // Penunjuk (Arrow)
                const Icon(
                  Icons.arrow_drop_down,
                  size: 60,
                  color: Colors.white,
                ),
              ],
            ),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: _spinWheel,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isSpinning
                    ? Colors.grey
                    : CasinoTheme.accentGreen,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
              ),
              child: Text(
                _isSpinning ? "SPINNING..." : "SPIN NOW!",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
