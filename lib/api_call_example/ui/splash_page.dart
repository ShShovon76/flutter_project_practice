import 'package:flutter/material.dart';
import 'package:my_first_project/api_call_example/services/auth_service.dart';
import 'package:my_first_project/api_call_example/ui/login.dart';
import 'package:my_first_project/api_call_example/ui/product_list.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startSplash();
  }

  void _startSplash() async {
    await Future.delayed(const Duration(seconds: 3));

    final token = await authService.getToken();

    if (!mounted) return;

    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ProductListPage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // change if needed
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // App Logo
            Image.asset('assets/job-portal.png', width: 120, height: 120),

            const SizedBox(height: 20),

            // Loader
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
