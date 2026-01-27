import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../services/auth_service.dart';
import 'lobby_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  void _handleLogin() async {
    setState(() => _isLoading = true);
    final result = await _authService.login(
      _userController.text,
      _passController.text,
    );
    setState(() => _isLoading = false);

    if (result['status'] == 'success') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LobbyScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(result['message'])),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CasinoTheme.background,
      body: Container(
        decoration: BoxDecoration(
          // Efek Background Gradient Halus
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A237E).withOpacity(0.3),
              CasinoTheme.background,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // LOGO / ICON
                Icon(Icons.casino, size: 80, color: CasinoTheme.primaryGold),
                SizedBox(height: 10),
                Text(
                  "IMPERIUM SLOTS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 40),

                // CARD FORM
                Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: CasinoTheme.cardColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _userController,
                        style: TextStyle(color: Colors.white),
                        decoration: CasinoTheme.inputDecor(
                          "Username",
                          Icons.person,
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: _passController,
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        decoration: CasinoTheme.inputDecor(
                          "Password",
                          Icons.lock,
                        ),
                      ),
                      SizedBox(height: 25),

                      // TOMBOL LOGIN GRADIENT
                      _isLoading
                          ? CircularProgressIndicator(
                              color: CasinoTheme.primaryGold,
                            )
                          : Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: CasinoTheme.goldGradient,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: CasinoTheme.primaryGold.withOpacity(
                                      0.3,
                                    ),
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: _handleLogin,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Text(
                                  "LOGIN",
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
                SizedBox(height: 20),

                // TEXT DAFTAR
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: "Belum punya akun? ",
                      style: TextStyle(color: CasinoTheme.textGrey),
                      children: [
                        TextSpan(
                          text: "Daftar Disini",
                          style: TextStyle(
                            color: CasinoTheme.primaryGold,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
