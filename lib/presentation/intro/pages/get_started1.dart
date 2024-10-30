import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/presentation/intro/pages/get_started2.dart';

class GetStartedPage1 extends StatelessWidget {
  const GetStartedPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1483C2).withOpacity(0.95),
      body: Stack(
        children: [
          // Shoe image on the right
          Positioned.fill(
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Image.asset(
                'assets/images/getStarted1.png',
                fit: BoxFit.contain,
                height: 820,
              ),
            ),
          ),
          // Nike vector logo
          Positioned.fill(
            top: 250,
            child: Image.asset(
              'assets/images/nike_vector.png',
            ),
          ),
          //Positioned(
            //top: 220,
            //left: 40,
            //child: Image.asset(
              //'assets/images/getStarted1_vector.png',
              //height: 560,
            //),
          //),
          // Text and button section
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const SizedBox(height: 100),
                const Center(
                  child: Column(
                    children: [
                      Text(
                        'WELCOME TO',
                        style: TextStyle(
                          fontSize: 30, // Increased size
                          fontWeight: FontWeight.w900, // Boldest weight
                          color: Color(0xffECECEC),
                        ),
                      ),
                      Text(
                        'NIKE',
                        style: TextStyle(
                          fontSize: 30, // Increased size
                          fontWeight: FontWeight.w900, // Boldest weight
                          color: Color(0xffECECEC),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Positioned(
                  bottom: 80, // Position at the bottom
                  left: 0,
                  right: 0,
                  child: Padding(
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
                                    const GetStartedPage2()),
                          );
                        },
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                            color: Color(0xff2B2B2B),
                            fontWeight: FontWeight.bold,
                            fontSize: 16, // Font size increase for visibility
                          ),
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
