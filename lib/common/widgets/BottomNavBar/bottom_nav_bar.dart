import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nike_sneaker_store/presentation/cart/pages/cart.dart';
import 'package:nike_sneaker_store/presentation/favourite_shoes/pages/favourite_shoes.dart';
import 'package:nike_sneaker_store/presentation/home/pages/home.dart';
import 'package:nike_sneaker_store/presentation/notification/pages/notification.dart';
import 'package:nike_sneaker_store/presentation/profile/pages/profile.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onIconPressed;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onIconPressed,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Background image for the navigation area
          Image.asset(
            'assets/images/navBarVector.png',
            width: double.infinity,
          ),
          Positioned(
            bottom: 50,
            child: Center(
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: const Color(0xff0D6EFD),
                  borderRadius: BorderRadius.circular(90),
                ),
                child: IconButton(
                  icon: const Icon(Iconsax.shopping_bag4, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const CartPage()),
                    );
                  },
                ),
              ),
            ),
          ),

          // Icons on top of the image
          Positioned(
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Iconsax.home4,
                      size: 26,
                      color: widget.selectedIndex == 0
                          ? const Color(0xff0D6EFD)
                          : const Color(0xff707B81)),
                  onPressed: () {
                    widget.onIconPressed(0);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    ); // Notify parent of the selected index
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: Icon(Iconsax.heart4,
                      size: 26,
                      color: widget.selectedIndex == 1
                          ? const Color(0xff0D6EFD)
                          : const Color(0xff707B81)),
                  onPressed: () {
                    widget.onIconPressed(1);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavouriteShoes(),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 130),
                IconButton(
                  icon: Icon(Iconsax.notification4,
                      size: 26,
                      color: widget.selectedIndex == 2
                          ? const Color(0xff0D6EFD)
                          : const Color(0xff707B81)),
                  onPressed: () {
                    widget.onIconPressed(2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: Icon(Iconsax.user4,
                      size: 26,
                      color: widget.selectedIndex == 3
                          ? const Color(0xff0D6EFD)
                          : const Color(0xff707B81)),
                  onPressed: () {
                    widget.onIconPressed(3);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
