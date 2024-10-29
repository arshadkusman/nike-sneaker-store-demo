import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/presentation/home/pages/home.dart';

class SuccessAlert extends StatelessWidget {
  const SuccessAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        color: Colors.transparent.withOpacity(0.2),
        child: AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: const Color(0xffFFFFFF),
          content: SizedBox(
            height: 375,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: const Color(0xffDFEFFF),
                  foregroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/celebration_vector.png',
                    fit: BoxFit.contain,
                    height: 90,
                    width: 70,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Your Payment is \n Successful',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff2B2B2B),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 19,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: const Color(0xff0D6EFD),
                      ),
                      child: const Text(
                        'Back TO Shopping',
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
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
