import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nike_sneaker_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:nike_sneaker_store/common/widgets/shoe_card/shoe_card.dart';
import 'package:nike_sneaker_store/domain/entities/shoe_entity.dart';
import 'package:nike_sneaker_store/domain/usecases/get_shoes.dart';
import 'package:nike_sneaker_store/presentation/details/pages/details.dart';

class PopularShoesPage extends StatelessWidget {
  const PopularShoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF7F7F9),
      appBar: BasicAppBar(
        title: 'Popular Shoes',
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
              child: FutureBuilder<List<Shoe>>(
                future: context
                    .read<GetShoesUseCase>()
                    .call(), // Fetch shoes directly
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No shoes found.'));
                  } else {
                    final shoes = snapshot.data!;
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
