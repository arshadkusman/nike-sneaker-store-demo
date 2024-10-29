import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/presentation/auth/widgets/popup.dart';

class RecovryPasswordPage extends StatelessWidget {
  const RecovryPasswordPage({super.key});

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
            Navigator.pop(
              context,
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
              'Forgot Password',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter Your Email Account To Reset',
              style: TextStyle(
                color: Color(0xff707B81),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              'Your Password',
              style: TextStyle(
                color: Color(0xff707B81),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                hintText: 'xxxxxxxx',
                hintStyle: const TextStyle(
                  color: Color(0xff6A6A6A),
                  letterSpacing: 1.5,
                ),
                filled: true,
                fillColor: const Color(0xffF7F7F9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const Popup();
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  // ignore: prefer_const_constructors
                  backgroundColor: Color(0xff0D6EFD),
                ),
                child: const Text(
                  'Reset Password',
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
