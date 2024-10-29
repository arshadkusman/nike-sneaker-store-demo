import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nike_sneaker_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:nike_sneaker_store/presentation/cart/bloc/cart_shoes_cubit.dart';
import 'package:nike_sneaker_store/presentation/cart/pages/cart.dart';
import 'package:nike_sneaker_store/presentation/favourite_shoes/bloc/favourite_shoes_cubit.dart';
import '../../../domain/entities/shoe_entity.dart';
import '../bloc/details_bloc.dart';

class DetailsPage extends StatelessWidget {
  final Shoe shoe;

  const DetailsPage({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DetailsBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xffF7F7F9),
        appBar: BasicAppBar(
          title: 'Sneaker Shop',
          titleStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          leadingIcon: Icons.arrow_back_ios_new,
          onLeadingIconPressed: () {
            Navigator.pop(context);
          },
          leadingIconSize: 22,
          actions: [
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              onPressed: () {},
              icon: const Icon(Iconsax.shopping_bag4, size: 26),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                shoe.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              const SizedBox(height: 10),
              const Text(
                'Men\'s Shoes',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                '\$${shoe.price}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),

              const SizedBox(height: 10),
              Center(
                child: Image.asset(
                  shoe.imageUrl,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                      'assets/images/shoe1.png',
                      width: 59.8,
                      height: 57.28,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                      'assets/images/shoe2.png',
                      width: 59.8,
                      height: 57.28,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                      'assets/images/shoe3.png',
                      width: 59.8,
                      height: 57.28,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                      'assets/images/shoe4.png',
                      width: 59.8,
                      height: 57.28,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                      'assets/images/shoe5.png',
                      width: 59.8,
                      height: 57.28,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Shoe Description
              Text(
                shoe.description,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Read more',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xff0D6EFD)),
                ),
              ),

              const Spacer(),

              // Add to Cart Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xffD9D9D9).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child:
                        BlocBuilder<FavouriteShoesCubit, FavouriteShoesState>(
                      builder: (context, favouriteState) {
                        return IconButton(
                          icon: Icon(
                            shoe.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: shoe.isFavorite ? Colors.red : null,
                          ),
                          onPressed: () {
                            context
                                .read<FavouriteShoesCubit>()
                                .toggleFavorite(shoe);
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: BlocBuilder<CartShoesCubit, CartShoesState>(
                      builder: (context, cartState) {
                        return ElevatedButton(
                          onPressed: () {
                            shoe.isInCart
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const CartPage()),
                                  )
                                : context
                                    .read<CartShoesCubit>()
                                    .toggleCart(shoe);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16),
                            backgroundColor: shoe.isInCart
                                ? const Color(0xffFFFFFF)
                                : const Color(0xff0D6EFD),
                            alignment: Alignment.center,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.shopping_bag4,
                                size: 24,
                                color: shoe.isInCart
                                    ? const Color(0xff0D6EFD)
                                    : const Color(0xffFFFFFF),
                              ),
                              const SizedBox(width: 20),
                              Text(shoe.isInCart ? 'Go to Cart' : 'Add to Cart',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: shoe.isInCart
                                          ? const Color(0xff0D6EFD)
                                          : const Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
