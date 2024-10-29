import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nike_sneaker_store/common/widgets/appbar/basic_app_bar.dart';
import 'package:nike_sneaker_store/presentation/cart/bloc/cart_shoes_cubit.dart';
import 'package:nike_sneaker_store/presentation/cart/widgets/alert_dialoge.dart';


class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

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
      body:BlocBuilder<CartShoesCubit, CartShoesState>(
        builder: (context, cartState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Cart details, contact info, and address sections...
                  Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xffFFFFFF),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Contact Information',
                        style: TextStyle(
                            color: Color(0xff1A2530),
                            fontSize: 15,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 42,
                            width: 42,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xff707B81).withOpacity(0.1),
                            ),
                            child: const Icon(Iconsax.sms4),
                          ),
                          const SizedBox(width: 20),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  'arshadkk@gmail.com',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Color(0xff2B2B2B),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      'Email',
                                      style: TextStyle(
                                        color: Color(0xff707B81),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xff707B81).withOpacity(0.1),
                            ),
                            child: const Icon(Iconsax.call4),
                          ),
                          const SizedBox(width: 20),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  '+234-811-732-5298',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Color(0xff2B2B2B),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      'Phone',
                                      style: TextStyle(
                                        color: Color(0xff707B81),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Address',
                        style: TextStyle(
                            color: Color(0xff1A2530),
                            fontSize: 15,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '1082 Airport Road, Nigeria',
                            style: TextStyle(
                              color: Color(0xff707B81),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 110,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xff000000),
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/map.png'),
                                    fit: BoxFit.fitWidth,
                                    opacity: 0.6)),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'View Map',
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 5),
                                Icon(
                                  Iconsax.location4,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Payment Method',
                        style: TextStyle(
                            color: Color(0xff1A2530),
                            fontSize: 15,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xff707B81).withOpacity(0.1),
                            ),
                            child: const Icon(Iconsax.cards),
                          ),
                          const SizedBox(width: 20),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  'DbL Card',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Color(0xff2B2B2B),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      '**** **** 0696 4629',
                                      style: TextStyle(
                                        color: Color(0xff707B81),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
                ],
              ),
            ),
          );
        },
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
                         context.read<CartShoesCubit>().clearCart();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const SuccessAlert();
                          },
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
