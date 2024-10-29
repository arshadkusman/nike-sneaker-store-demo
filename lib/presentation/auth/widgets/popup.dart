import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nike_sneaker_store/presentation/auth/pages/otp_verification.dart';

class Popup extends StatefulWidget {
  const Popup({super.key});

  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        color: Colors.transparent.withOpacity(0.2),
        child: const AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: Color(0xffFFFFFF),
          content: SizedBox(
            height: 200,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0xff0D6EFD),
                    foregroundColor: Colors.white,
                    child: Icon(Iconsax.sms)),
                SizedBox(height: 20),
                Text(
                  'Check Your Mail',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff2B2B2B),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'We have send password recovery',
                  style: TextStyle(
                      color: Color(0xff707B81),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'code in your email',
                  style: TextStyle(
                      color: Color(0xff707B81),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const OTPVerificationPage()));
  }
}
