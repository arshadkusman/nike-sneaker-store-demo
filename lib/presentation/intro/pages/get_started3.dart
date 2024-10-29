import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/presentation/auth/pages/signin.dart';

class GetStartedPage3 extends StatelessWidget {
  const GetStartedPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1483C2).withOpacity(0.95),
      body: Stack(
        children: [
          // Shoe image on the right
          Positioned(
            top: 40,
            child: Image.asset(
              'assets/images/getStarted3.png',
              fit: BoxFit.contain,
              height: 520,
              width: 400,
            ),
          ),

          // Nike vector logo
          Positioned.fill(
            top: 250,
            child: Image.asset(
              'assets/images/nike_vector.png',
            ),
          ),

          // Text and button section
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const SizedBox(height: 454),
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'You Have the',
                        style: TextStyle(
                          fontSize: 36, // Increased size
                          fontWeight: FontWeight.w900, // Boldest weight
                          color: Color(0xffECECEC),
                        ),
                      ),
                      Text(
                        'Power To',
                        style: TextStyle(
                          fontSize: 36, // Increased size
                          fontWeight: FontWeight.w900, // Boldest weight
                          color: Color(0xffECECEC),
                        ),
                      ),
                      SizedBox(height: 18),
                      Text(
                        'There Are Many Beautiful And Attractive',
                        style: TextStyle(
                          fontSize: 16, // Increased size
                          fontWeight: FontWeight.normal, // Boldest weight
                          color: Color(0xffD8D8D8),
                        ),
                      ),
                      Text(
                        'Plants To Your Room',
                        style: TextStyle(
                          fontSize: 16, // Increased size
                          fontWeight: FontWeight.normal, // Boldest weight
                          color: Color(0xffD8D8D8),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: SizedBox(
                    width: double.infinity, // Full width button
                    height: 54, // Adjust height as needed
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: const Color(0xffECECEC),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SignInPage()),
                        );
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Color(0xff2B2B2B),
                          fontWeight: FontWeight.bold,
                          fontSize: 16, // Font size increase for visibility
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
