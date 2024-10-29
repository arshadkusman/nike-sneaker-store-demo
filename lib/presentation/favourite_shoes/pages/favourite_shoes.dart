import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nike_sneaker_store/common/widgets/BottomNavBar/bottom_nav_bar.dart';
import 'package:nike_sneaker_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:nike_sneaker_store/common/widgets/shoe_card/shoe_card.dart';
import 'package:nike_sneaker_store/presentation/details/pages/details.dart';
import 'package:nike_sneaker_store/presentation/favourite_shoes/bloc/favourite_shoes_cubit.dart';

class FavouriteShoes extends StatefulWidget {
  const FavouriteShoes({super.key});

  @override
  State<FavouriteShoes> createState() => _FavouriteShoesState();
}

class _FavouriteShoesState extends State<FavouriteShoes> {
  int selectedIndex = 1;

  void _onBottomNavIconPressed(int index) {
    setState(() {
      selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF7F7F9),
      appBar: BasicAppBar(
        title: 'Favourites',
        titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        leadingIcon: Icons.arrow_back_ios_new,
        onLeadingIconPressed: () {
          Navigator.pop(context);
        },
        leadingIconSize: 22,
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            onPressed: () {},
            icon: const Icon(Iconsax.heart, size: 26),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: BlocBuilder<FavouriteShoesCubit, FavouriteShoesState>(
                builder: (context, state) {
                  if (state is FavouriteShoeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FavouriteShoeError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else if (state is FavoriteShoeLoaded) {
                    final shoes = state.favoriteShoes;
                    if (shoes.isEmpty) {
                      return const Center(
                          child: Text(
                        'No Favourite shoes found.',
                        style: TextStyle(color: Color(0xff2B2B2B)),
                      ));
                    }
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: shoes.length,
                      itemBuilder: (context, index) {
                        final shoe = shoes[index];
                        return ShoeCard(
                          showColorOptions: true,
                          shoe: shoe,
                          onTap: () {
                            // Navigate to DetailsPage using MaterialPageRoute
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(shoe: shoe),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: CustomBottomNavBar(
          selectedIndex: selectedIndex, // Pass current index
          onIconPressed: _onBottomNavIconPressed, // Handle icon press
        ),
      ),
    );
  }
}
