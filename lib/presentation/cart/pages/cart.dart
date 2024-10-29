import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:nike_sneaker_store/presentation/cart/bloc/cart_shoes_cubit.dart';
import 'package:nike_sneaker_store/presentation/cart/pages/checkout.dart';
import 'package:nike_sneaker_store/presentation/details/pages/details.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F9),
      appBar: BasicAppBar(
        title: 'My Cart',
        titleStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        leadingIcon: Icons.arrow_back_ios_new,
        onLeadingIconPressed: () {
          Navigator.pop(context);
        },
        leadingIconSize: 22,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<CartShoesCubit, CartShoesState>(
          builder: (context, state) {
            if (state is CartShoeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CartShoesError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is CartShoesLoaded) {
              final shoes = state.cartShoes;
              final subtotal = shoes.fold(0.0, (sum, shoe) => sum + shoe.price);
              const deliveryFee = 60.20; // For example, can be dynamic
              // ignore: unused_local_variable
              final total = subtotal + deliveryFee;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${shoes.length} item${shoes.length == 1 ? '' : 's'}',
                    style: const TextStyle(
                      color: Color(0xff2B2B2B),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: shoes.isEmpty
                        ? const Center(
                            child: Text(
                            'Cart is empty',
                            style: TextStyle(color: Color(0xff2B2B2B)),
                          ))
                        : ListView.separated(
                            itemCount: shoes.length,
                            itemBuilder: (context, index) {
                              final shoe = shoes[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsPage(shoe: shoe),
                                    ),
                                  );
                                },
                                child: Dismissible(
                                  key: ValueKey(shoe.id),
                                  background: Container(
                                    color: Colors.red,
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(right: 20),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 4,
                                    ),
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (direction) {
                                    context
                                        .read<CartShoesCubit>()
                                        .toggleCart(shoe);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: const Color(0xffFFFFFF),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              color: const Color(0xffF7F7F9),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: Image.asset(
                                                shoe.imageUrl,
                                                fit: BoxFit.cover,
                                                height: 90,
                                                width: 90,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 5),
                                                Text(
                                                  shoe.name,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Color(0xff2B2B2B),
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  '\$${shoe.price}',
                                                  style: const TextStyle(
                                                    color: Color(0xff2B2B2B),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 20),
                          ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<CartShoesCubit, CartShoesState>(
        builder: (context, state) {
          if (state is CartShoesLoaded) {
            final subtotal =
                state.cartShoes.fold(0.0, (sum, shoe) => sum + shoe.price);
            var deliveryFee = (subtotal == 0) ? 0 : 60.20;
            final total = subtotal + deliveryFee;

            return Container(
              height: 300,
              width: double.infinity,
              color: const Color(0xffFFFFFF),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Subtotal',
                          style: TextStyle(
                              color: Color(0xff707B81),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Text(
                          '\$${subtotal.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Color(0xff2B2B2B),
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Delivery',
                          style: TextStyle(
                              color: Color(0xff707B81),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Text(
                          '\$${deliveryFee.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Color(0xff2B2B2B),
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Color(0xff707B81)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Total Cost',
                          style: TextStyle(
                              color: Color(0xff2B2B2B),
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Text(
                          '\$${total.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Color(0xff0D6EFD),
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const CheckoutPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          backgroundColor: const Color(0xff0D6EFD),
                        ),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
