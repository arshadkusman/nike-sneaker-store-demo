import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/presentation/auth/pages/forget_password.dart';
import 'package:nike_sneaker_store/presentation/auth/pages/signup.dart';
import 'package:nike_sneaker_store/presentation/home/pages/home.dart';

import 'package:nike_sneaker_store/presentation/intro/pages/get_started3.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xff2B2B2B)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const GetStartedPage3()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Hello Again!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Fill Your Details Or Continue With',
              style: TextStyle(
                color: Color(0xff707B81),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              'Social Media',
              style: TextStyle(
                color: Color(0xff707B81),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 40),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Email Address',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff2B2B2B),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'xyz@gmail.com',
                hintStyle: const TextStyle(
                  color: Color(0xff6A6A6A),
                ),
                filled: true,
                fillColor: const Color(0xffF7F7F9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Password',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff2B2B2B),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                hintText: '●●●●●●●●',
                hintStyle: const TextStyle(
                  color: Color(0xff6A6A6A),
                ),
                filled: true,
                fillColor: const Color(0xffF7F7F9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const RecovryPasswordPage()),
                  );
                },
                child: const Text(
                  'Recovery Password',
                  style: TextStyle(
                      color: Color(0xff707B81),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Handle sign-in
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  // ignore: prefer_const_constructors
                  backgroundColor: Color(0xff0D6EFD),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const HomePage()),
                  );
                },
                icon: Image.asset(
                  'assets/images/google_logo.png', // The custom Google logo
                  width: 24,
                  height: 24,
                ),
                label: const Text(
                  'Sign In With Google',
                  style: TextStyle(
                      color: Color(0xff2B2B2B),
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: const Color(0xffF7F7F9),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'New User?',
                  style: TextStyle(
                      color: Color(0xff6A6A6A),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SignUpPage()),
                    );
                  },
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                        color: Color(0xff1A1D1E),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
