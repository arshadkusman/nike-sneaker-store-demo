import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/presentation/intro/pages/get_started2.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

 @override
  void initState() {
    super.initState();
    redirect();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0D6EFD),
      body: Center(
        child:
            Image.asset('assets/images/nike_logo.png', height: 130, width: 157),
      ),
    );
  }

   Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context,
      MaterialPageRoute(
        builder: (BuildContext context) => const GetStartedPage2()
      )
    );
  }
}
