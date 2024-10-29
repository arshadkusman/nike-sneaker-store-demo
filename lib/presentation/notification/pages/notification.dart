import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nike_sneaker_store/common/widgets/appbar/basic_app_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: BasicAppBar(
        title: 'Notifications',
        titleStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        leadingIcon: Icons.arrow_back_ios_new,
        onLeadingIconPressed: () {
          Navigator.pop(context);
        },
        leadingIconSize: 22,
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            onPressed: () {},
            icon: const Icon(Iconsax.profile_delete),
            iconSize: 26,
          ),
        ],
      ),
      body: const Padding(padding: EdgeInsets.symmetric(horizontal: 12)),
    );
  }
}
