import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nike_sneaker_store/common/widgets/BottomNavBar/bottom_nav_bar.dart';
import 'package:nike_sneaker_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:nike_sneaker_store/presentation/home/widgets/drawer/drawer.dart';
import 'package:nike_sneaker_store/common/widgets/shoe_card/shoe_card.dart';
import 'package:nike_sneaker_store/presentation/home/pages/popular_shoes.dart';
import '../../../domain/entities/shoe_entity.dart';
import '../../../domain/usecases/get_shoes.dart';
import '../../details/pages/details.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void _onBottomNavIconPressed(int index) {
    setState(() {
      selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(context.read<GetShoesUseCase>()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffF7F7F9),
        appBar: BasicAppBar(
          title: 'Explore',
          actions: [
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              onPressed: () {},
              icon: const Icon(Iconsax.shopping_bag4, size: 26),
            ),
          ],
        ),
        drawer: const Drawer(child: DrawerWidget()),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Icon(
                            Iconsax.search_normal,
                          ),
                        ),
                        hintText: 'Looking for shoes',
                        hintStyle: const TextStyle(),
                        filled: true,
                        fillColor: const Color(0xffFFFFFF),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xff0D6EFD),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: const Icon(Iconsax.setting_4, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Categories
              const Text('Select Category',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 20),
              const SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryChip(label: 'All Shoes'),
                    CategoryChip(label: 'Outdoor'),
                    CategoryChip(label: 'Tennis'),
                    CategoryChip(label: 'Sports'),
                  ],
                ),
              ),

              // Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Popular Shoes',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  TextButton(
                    onPressed: () {
                      // Navigate to DetailsPage using MaterialPageRoute
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PopularShoesPage(),
                        ),
                      );
                    },
                    child: const Text('See all',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xff0D6EFD))),
                  )
                ],
              ),
              const SizedBox(height: 20),

              // Popular Shoes Section
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
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('New Arrivals',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color(0xff2B2B2B))),
                  Text('See all',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xff0D6EFD))),
                ],
              ),

              Center(
                child: SizedBox(
                  height: 120,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Image.asset(
                          'assets/images/homeCard.png',
                          height: 90,
                          width: 220,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(),
                            child:
                                Image.asset('assets/images/homeCardShoe.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
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
      ),
    );
  }
}

// CategoryChip and ShoeCard remain unchanged

class CategoryChip extends StatefulWidget {
  final String label;

  const CategoryChip({super.key, required this.label});

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selected = true;
          });
        },
        onDoubleTap: () {
          setState(() {
            selected = false;
          });
        },
        child: Chip(
          side: BorderSide.none,
          label: Text(widget.label),
          backgroundColor:
              selected ? const Color(0xff0D6EFD) : const Color(0xffFFFFFF),
          labelStyle: TextStyle(
              color:
                  selected ? const Color(0xffFFFFFF) : const Color(0xff2B2B2B),
              letterSpacing: 1.5),
        ),
      ),
    );
  }
}
