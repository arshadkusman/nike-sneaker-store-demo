import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nike_sneaker_store/presentation/auth/pages/signin.dart';
import 'package:nike_sneaker_store/presentation/cart/pages/cart.dart';
import 'package:nike_sneaker_store/presentation/favourite_shoes/pages/favourite_shoes.dart';
import 'package:nike_sneaker_store/presentation/notification/pages/notification.dart';
import 'package:nike_sneaker_store/presentation/profile/pages/profile.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1483C2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CircleAvatar(
                      radius: 44,
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      backgroundImage:
                          AssetImage('assets/images/profile_photo.jpeg'),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Arshad K Usman',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            ListTile(
              leading: const Icon(
                Iconsax.user4,
                color: Color(0xffFFFFFF),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffFFFFFF),
                size: 14,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(color: Color(0xffFFFFFF)),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Iconsax.shopping_bag4,
                color: Color(0xffFFFFFF),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffFFFFFF),
                size: 14,
              ),
              title: const Text(
                'My Cart',
                style: TextStyle(color: Color(0xffFFFFFF)),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const CartPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Iconsax.heart,
                color: Color(0xffFFFFFF),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffFFFFFF),
                size: 14,
              ),
              title: const Text(
                'Favourite',
                style: TextStyle(color: Color(0xffFFFFFF)),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const FavouriteShoes()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Iconsax.shopping_cart,
                color: Color(0xffFFFFFF),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffFFFFFF),
                size: 14,
              ),
              title: const Text(
                'Orders',
                style: TextStyle(color: Color(0xffFFFFFF)),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Iconsax.notification4,
                color: Color(0xffFFFFFF),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffFFFFFF),
                size: 14,
              ),
              title: const Text(
                'Notifications',
                style: TextStyle(color: Color(0xffFFFFFF)),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const NotificationPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Iconsax.setting4,
                color: Color(0xffFFFFFF),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffFFFFFF),
                size: 14,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(color: Color(0xffFFFFFF)),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const ProfilePage()),
                );
              },
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 19),
              child: Divider(
                color: Color(0xffFFFFFF),
                thickness: 1.5,
              ),
            ),
            ListTile(
              leading: const Icon(
                Iconsax.logout,
                color: Color(0xffFFFFFF),
              ),
              title: const Text(
                'Sign out',
                style: TextStyle(color: Color(0xffFFFFFF)),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const SignInPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
