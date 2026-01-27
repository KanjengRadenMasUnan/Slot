import 'package:flutter/material.dart';
import '../config/theme.dart'; // Pastikan path ini benar
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController(); // Controller baru

  final AuthService _authService = AuthService();
  bool _isLoading = false;

  void _handleRegister() async {
    String username = _userController.text.trim();
    String password = _passController.text.trim();
    String confirmPass = _confirmPassController.text.trim();

    // 1. Validasi Input Dasar
    if (username.isEmpty || password.isEmpty || confirmPass.isEmpty) {
      _showSnack("Semua kolom wajib diisi!", Colors.orange);
      return;
    }

    // 2. Validasi Password Match
    if (password != confirmPass) {
      _showSnack("Konfirmasi password tidak cocok!", Colors.red);
      return;
    }

    // 3. Validasi Panjang Password
    if (password.length < 6) {
      _showSnack("Password minimal 6 karakter!", Colors.orange);
      return;
    }

    setState(() => _isLoading = true);

    // 4. Panggil API
    final result = await _authService.register(username, password);

    setState(() => _isLoading = false);

    if (result['status'] == 'success') {
      _showSnack(result['message'], CasinoTheme.accentGreen);
      await Future.delayed(const Duration(seconds: 2)); // Beri waktu baca notif
      if (mounted) Navigator.pop(context); // Kembali ke Login
    } else {
      _showSnack(result['message'] ?? "Gagal Mendaftar", Colors.red);
    }
  }

  void _showSnack(String msg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(msg, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CasinoTheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Icon(
                Icons.app_registration,
                size: 70,
                color: CasinoTheme.accentGreen,
              ),
              const SizedBox(height: 10),
              const Text(
                "JOIN IMPERIUM",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const Text(
                "Dapatkan Bonus IDR 100.000",
                style: TextStyle(color: CasinoTheme.primaryGold, fontSize: 14),
              ),

              const SizedBox(height: 40),

              // CARD FORM
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: CasinoTheme.cardColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _userController,
                      style: const TextStyle(color: Colors.white),
                      decoration: CasinoTheme.inputDecor(
                        "Username Baru",
                        Icons.person_add,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: _passController,
                      style: const TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: CasinoTheme.inputDecor(
                        "Password",
                        Icons.lock_outline,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: _confirmPassController,
                      style: const TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: CasinoTheme.inputDecor(
                        "Ulangi Password",
                        Icons.lock,
                      ),
                    ),
                    const SizedBox(height: 25),

                    // TOMBOL DAFTAR
                    _isLoading
                        ? const CircularProgressIndicator(
                            color: CasinoTheme.accentGreen,
                          )
                        : Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: CasinoTheme.accentGreen,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: CasinoTheme.accentGreen.withOpacity(
                                    0.4,
                                  ),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: _handleRegister,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: const Text(
                                "BUAT AKUN",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
