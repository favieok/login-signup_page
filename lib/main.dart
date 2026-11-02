
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color vividTurquoise = Color(0xFF00c1af);
const Color darkAzure = Color(0xFF071216);
const Color darkText = Color(0xFF07161C);
const Color lightBackground = Color(0xFFFFFFFF);

void main() {
  runApp(const MedcelerApp());
}

class MedcelerApp extends StatelessWidget {
  const MedcelerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData.light();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medceler',
      theme: baseTheme.copyWith(
        scaffoldBackgroundColor: lightBackground,
        textTheme: baseTheme.textTheme.apply(
          fontFamily: GoogleFonts.nunito().fontFamily,
          bodyColor: darkText,
          displayColor: darkText,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: vividTurquoise,
          primary: darkAzure,
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class MedcelerLogo extends StatelessWidget {
  const MedcelerLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/medceler_logo.png',
        height: 75,
        fit: BoxFit.contain,
      ),
    );
  }
}

class MedcelerInput extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType;

  const MedcelerInput({
    super.key,
    required this.label,
    required this.icon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: darkAzure),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: vividTurquoise, width: 2),
        ),
      ),
    );
  }
}

class MedcelerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MedcelerButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: darkAzure,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const MedcelerLogo(),
                  const SizedBox(height: 12),
                  Text(
                    'Don’t wait in line. Book Online.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      color: darkAzure,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 45),
                  Text(
                    'Welcome Back!',
                    style: GoogleFonts.nunito(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: darkText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Log in to manage your appointments.'),
                  const SizedBox(height: 28),
                  const MedcelerInput(
                    label: 'Email Address',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 18),
                  const MedcelerInput(
                    label: 'Password',
                    icon: Icons.lock_outline,
                    obscureText: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: darkAzure),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  MedcelerButton(
                    text: 'Log In',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignupPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: darkAzure,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const MedcelerLogo(),
                  const SizedBox(height: 35),
                  Text(
                    'Create Account',
                    style: GoogleFonts.nunito(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: darkText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Create an account to book your appointments.'),
                  const SizedBox(height: 25),
                  const MedcelerInput(
                    label: 'Full Name',
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(height: 16),
                  const MedcelerInput(
                    label: 'Phone Number',
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  const MedcelerInput(
                    label: 'Email Address',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  const MedcelerInput(
                    label: 'Password',
                    icon: Icons.lock_outline,
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  const MedcelerInput(
                    label: 'Confirm Password',
                    icon: Icons.lock_outline,
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),
                  MedcelerButton(
                    text: 'Create Account',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            color: darkAzure,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
