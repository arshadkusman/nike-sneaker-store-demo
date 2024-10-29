import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:nike_sneaker_store/presentation/auth/pages/forget_password.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFFFFFF),
      appBar: BasicAppBar(
        title: 'Profile',
        titleStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        backgroundColor: const Color(0xffFFFFFF),
        leadingIcon: Icons.arrow_back_ios_new,
        leadingIconSize: 22,
        onLeadingIconPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 44,
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/profile_photo.jpeg'),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Your Name',
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
            const SizedBox(height: 30),
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
            const SizedBox(height: 40),
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
                  'Save Now',
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
