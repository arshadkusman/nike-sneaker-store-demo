import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/domain/entities/shoe_entity.dart';
import 'package:nike_sneaker_store/presentation/favourite_shoes/bloc/favourite_shoes_cubit.dart';

class ShoeCard extends StatelessWidget {
  final Shoe shoe;
  final VoidCallback onTap;
  final bool showPlusIcon;
  final bool showColorOptions;

  const ShoeCard({
    super.key,
    required this.shoe,
    required this.onTap,
    this.showPlusIcon =
        false, // Default to false, can be set to true for popular shoes

    this.showColorOptions =
        false, // Default to false, set true if you want color options like favourite shoes
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xffFFFFFF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<FavouriteShoesCubit, FavouriteShoesState>(
              builder: (context, favouriteState) {
                return IconButton(
                  icon: Icon(
                    shoe.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: shoe.isFavorite ? Colors.red : null,
                  ),
                  alignment: Alignment.topLeft,
                  iconSize: 18,
                  onPressed: () {
                    context.read<FavouriteShoesCubit>().toggleFavorite(shoe);
                  },
                );
              },
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  shoe.imageUrl,
                  height: 200,
                  width: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'BEST SELLER',
                    style: TextStyle(
                      color: Color(0xff0D6EFD),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    shoe.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xff6A6A6A),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '\$${shoe.price}',
                        style: const TextStyle(
                          color: Color(0xff2B2B2B),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      if (showPlusIcon)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xff0D6EFD),
                              borderRadius: BorderRadius.circular(90),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      if (showColorOptions)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  color: const Color(0xffCB1D1D),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  color: const Color(0xff0B2F8B),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
